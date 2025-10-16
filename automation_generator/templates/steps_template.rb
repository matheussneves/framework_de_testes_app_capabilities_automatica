module Templates
  class StepsTemplate
    include CommonsTemplate

    attr_accessor :file_content, :file_path, :file_name, :endpoint, :data, :method, :main_var

    def initialize(file_path, file_name, data)
      self.main_var = 'endpoint'
      self.file_path = file_path
      self.file_name = file_name
      self.data = data

      splited_path = data.path.split('/')
      splited_path.shift
      splited_path = normalize_path(splited_path)
      self.endpoint = splited_path.join('_')

      create_file(file_path, file_name)
      self.file_content = load_file(file_path, file_name)
    end

    def build
      data.doc['paths'][data.endpoint].each_key do |method|
        self.method = method
        next unless file_content.match(/ #{endpoint}.#{method} /i).nil?

        build_steps
      end
    end

    def write
      if file_content == load_file(file_path, file_name)
        puts 'steps não foi gerado ou alterado'
      else
        update_file(file_path, file_name, file_content)
        puts 'steps foi gerado ou alterado'
      end
    end

    private

    def build_steps
      content = build_given
      content << build_when
      content << build_then

      file_content.insert(0, content)
    end

    def build_given
      path = data.doc['paths'][data.endpoint][method]

      %(Dado('ter uma massa configurada do endpoint #{endpoint}.#{method} para o cenário {tipo}') do |tipo|
  # Popular os parametros
  #{main_var} = OpenStruct.new
  #{main_var}.consumes = 'application/json'
  #{main_var}.produces = 'application/json'
  #{build_all_params(main_var)}
  if tipo.eql?('negativo')
    # Criar logica para o cenario negativo
    #{main_var}.header = OpenStruct.new unless #{main_var}.header
    #{main_var}.header['fault'] = 'error_#{last_error_code}'
  end

  @#{endpoint}_#{method} = #{main_var}
end
\n)
    end

    def build_when
      direct = "@#{endpoint}_#{method}.response = #{endpoint}().#{method}_#{data.service_name}(@#{endpoint}_#{method})"

      integration_testing = %(if @integration_testing
  else
    #{direct}
  end)

      %(Quando('chamar o endpoint #{endpoint}.#{method}') do
  #{%w[post put].include?(method) ? integration_testing : direct}
rescue StandardError => error
  @#{endpoint}_#{method}.error = error
ensure
  puts(@#{endpoint}_#{method}.request_log, @#{endpoint}_#{method}.response_log)
end
\n)
    end

    def build_then
      success_response = build_response("#{main_var}.response.body")
      fault_response = build_response("#{main_var}.response.body", success: false)

      default = %(if tipo.eql?('positivo')
      expect(#{main_var}.error).to be_nil

#{success_response}
      # Fazer as validacoes necessarias para o cenario positivo
    else
#{fault_response}
      # Fazer as validacoes necessarias para o cenario negativo
    end)

      integration_testing = %(if @integration_testing
      if tipo.eql?('positivo')
        # Fazer as validacoes necessarias para o cenario positivo
      else
        expect(#{main_var}.error).not_to be_nil

        # Fazer as validacoes necessarias para o cenario negativo
      end
    elsif tipo.eql?('positivo')
      expect(#{main_var}.error).to be_nil

#{success_response}
      # Fazer as validacoes necessarias para o cenario positivo
    else
#{fault_response}
      # Fazer as validacoes necessarias para o cenario negativo
    end)

      %(Então('validar o retorno do endpoint #{endpoint}.#{method} para o cenário {tipo}') do |tipo|
  aggregate_failures do
    #{main_var} = @#{endpoint}_#{method}
    #{%w[post put].include?(method) ? integration_testing : default}
  end
end#{"\n" unless file_content.empty?}\n)
    end

    # OpenAPI 3.0: header, cookie, path, query, body/requestBody
    def build_all_params(main_var)
      var = "#{main_var}."
      "#{build_params(var, 'header')}#{build_params(var, 'cookie')}#{build_params(var, 'path')}#{build_params(var, 'query')}#{build_request_body(var)}"
    end

    def build_params(variable, in_type)
      path = data.doc['paths'][data.endpoint][method]
      parameters = path['parameters'] || []

      return nil if parameters.none? { |item| item['in'].eql?(in_type) }

      in_type_snake_case = snake_case(in_type)

      content = "\n  #{variable}#{in_type_snake_case} = OpenStruct.new\n"

      parameters.each do |item|
        next unless item['in'] == in_type

        build_line(content, item, variable, in_type)
      end
      content
    end

    def build_request_body(variable)
      path = data.doc['paths'][data.endpoint][method]
      request_body = path['requestBody']
      return '' unless request_body

      content = "\n  #{variable}body = OpenStruct.new\n"
      content_types = request_body['content']&.keys || []
      content << "  #{variable}body['Content-Type'] = '#{content_types.first}'\n" unless content_types.empty?

      schema = request_body['content']&.values&.first&.dig('schema')
      if schema
        build_schema_model(content, "#{variable}body", schema)
      end
      content
    end

    def build_line(content, item, var, in_type)
      variable = "  #{var}#{snake_case(in_type)}['#{item['name']}']"
      if item['schema']
        build_schema_model(content, variable, item['schema'])
      else
        content << build_example_content(variable, item)
      end
    end

    def build_schema_model(content, variable, schema)
      if schema['$ref']
        model = get_schema_ref(schema['$ref'])
        build_schema_model(content, variable, model)
      elsif schema['type'] == 'object'
        content << "\n#{variable} = OpenStruct.new\n"
        (schema['properties'] || {}).each do |prop, prop_schema|
          build_schema_model(content, "#{variable}['#{prop}']", prop_schema)
        end
      elsif schema['type'] == 'array'
        item_var = "#{variable}_item"
        content << "#{item_var} = OpenStruct.new\n"
        build_schema_model(content, item_var, schema['items'])
        content << "#{variable} = [#{item_var}]\n"
      else
        value = schema['example'] || schema['default'] || schema['type']
        content << "#{variable} = #{value.is_a?(String) ? "'#{value}'" : value}\n"
      end
    end

    def get_schema_ref(ref)
      ref_path = ref.gsub('#/components/schemas/', '')
      data.doc['components']['schemas'][ref_path]
    end

    def build_example_content(variable, item)
      value = item['example'] || item['default'] || item['type']
      "#{variable} = #{value.is_a?(String) ? "'#{value}'" : value}\n"
    end

    def build_response(var, success: true)
      responses = data.doc['paths'][data.endpoint][method]['responses'] rescue nil

      content = ''
      return content unless responses.is_a?(Hash) && !responses.empty?

      responses.each_pair do |code, properties|
        next unless properties.is_a?(Hash) && properties['content']

        schema = properties['content'].values.first['schema'] rescue nil
        next unless schema

        if (success && code.to_i.between?(200, 299)) || (!success && code.to_i.between?(400, 599))
          walk_schema(schema, content, var)
          break
        end
      end
      content
    end

    def walk_schema(schema, content, var)
      if schema['$ref']
        model = get_schema_ref(schema['$ref'])
        walk_schema(model, content, var)
      elsif schema['type'] == 'object'
        (schema['properties'] || {}).each do |prop, prop_schema|
          walk_schema_property(content, "#{var}['#{prop}']", prop_schema)
        end
      elsif schema['type'] == 'array'
        item_var = "#{var}.first"
        walk_schema(schema['items'], content, item_var)
      end
    end

    def walk_schema_property(content, variable, schema)
      if schema['$ref']
        model = get_schema_ref(schema['$ref'])
        walk_schema(model, content, variable)
      elsif schema['type'] == 'object'
        (schema['properties'] || {}).each do |prop, prop_schema|
          walk_schema_property(content, "#{variable}['#{prop}']", prop_schema)
        end
      elsif schema['type'] == 'array'
        item_var = "#{variable}.first"
        walk_schema(schema['items'], content, item_var)
      else
        value = schema['example'] || schema['default'] || schema['type']
        content << "      expect(#{variable}).to eql(#{value.is_a?(String) ? "'#{value}'" : value})\n"
      end
    end

    def last_error_code
      responses = data.doc['paths'][data.endpoint][method]['responses'] rescue nil
      return 'unknown_error' if responses.nil? || !responses.respond_to?(:keys) || responses.empty?
      responses.keys.last
    end
  end
end
