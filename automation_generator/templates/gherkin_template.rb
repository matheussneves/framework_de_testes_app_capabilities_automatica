module Templates
  class GherkinTemplate
    include CommonsTemplate

    attr_accessor :file_content, :file_path, :file_name, :endpoint

    def initialize(file_path, file_name, data)
      self.file_path = file_path
      self.file_name = file_name

      splited_path = data.path.split('/').map { |segment| segment.tr('.', '_') }
      splited_path.shift
      splited_path = normalize_path(splited_path)
      self.endpoint = splited_path.join('_')

      create_file(file_path, file_name, build_feature(data))
      self.file_content = load_file(file_path, file_name)
    end

    def build(data)
      data.doc['paths'][data.endpoint].each_key do |method|
        file_content << build_scenario(method) if file_content.match(/#{endpoint}.#{method}/i).nil?
      end
    end

    def write
      if file_content == load_file(file_path, file_name)
        puts 'gherkin não foi gerado ou alterado'
      else
        update_file(file_path, file_name, file_content)
        puts 'gherkin foi gerado ou alterado'
      end
    end

    private

    def build_feature(data)
      %(# language:pt

@#{encode_hyphen(data.system)}
@#{endpoint}
Funcionalidade: #{get_feature_name(data)}
  Como uma aplicação de APIs
  Quero chamar o endpoint da API
  Para validar a funcionalidade do mesmo\n)
    end

    def build_scenario(method)
      example = %(Exemplos:
      | tipo     |
      | positivo |
      | negativo |)

      teste_example = %(
    @ingress_testing\n    #{example})


      %(
  @#nome_responsavel???
  @#{endpoint}.#{method}
  Esquema do Cenário: Validar o endpoint #{endpoint}.#{method}
    Dado ter uma massa configurada do endpoint #{endpoint}.#{method} para o cenário <tipo>
    Quando chamar o endpoint #{endpoint}.#{method}
    Então validar o retorno do endpoint #{endpoint}.#{method} para o cenário <tipo>
#{teste_example}\n)
    end

    def get_feature_name(data)
      system_name = data.api_name

      endpoint_name = encode_endpoint(data.endpoint).split('/')
      endpoint_name.shift
      "#{system_name} | #{encode_endpoint(data.system)} - Validar o endpoint #{endpoint_name.join('_')}"
    end
  end
end
