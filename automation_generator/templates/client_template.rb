module Templates
  class ClientTemplate
    include CommonsTemplate

    attr_accessor :file_content, :file_path, :file_name

    def initialize(file_path, file_name, data)
      self.file_path = file_path
      self.file_name = file_name

      create_file(file_path, file_name, build_class(data))
      self.file_content = load_file(file_path, file_name)
    end

    def build(data)
      level_alignment(data)

      data.doc['paths'][data.endpoint].each_key do |method|
        next unless file_content.match(/def #{method}_#{data.service_name}/i).nil?

        base_uri = ":base_uri\n"

        index = file_content.index(base_uri) + base_uri.size
        file_content.insert(index, build_endpoint(data, method))
      end
    end

    def write
      if file_content == load_file(file_path, file_name)
        puts 'client não foi gerado ou alterado'
      else
        update_file(file_path, file_name, file_content)
        puts 'client foi gerado ou alterado'
      end
    end

    private

    def build_class(data)
      content = ''
      @identation_level = 0

      build_module(data, content)
      content << %(#{identation('add')}class #{first_upcase(data.service_name)}Class
#{identation('add')}include ApiCommons

#{identation}attr_accessor :base_uri

#{identation}def initialize(base_uri)
#{identation('add')}self.base_uri = base_uri
#{identation('remove')}end\n)

      content << "#{identation('remove')}end\n" while @identation_level.positive?

      splited_path = data.path.split('/')
      splited_path.shift
      splited_path.pop

      content << "\nWorld("
      splited_path.each_with_index do |path, index|
        content << '::' unless index.zero?
        content << first_upcase(path)
      end
      content << ")\n"
      content
    end

    def build_module(data, content)
      splited_path = data.path.split('/')
      splited_path.shift
      splited_path.pop
      splited_path = normalize_path(splited_path)

      splited_path.each_with_index do |path, index|
        content << "#{identation('add') unless index.zero?}module #{first_upcase(path)}\n"
      end
    end

    def build_endpoint(data, method)
      %(
#{identation}def #{method}_#{data.service_name}(params)
#{identation('add')}connection = get_new_connection(base_uri, params.header.to_h)
#{identation}package = build_package(__method__, self.class.name, params)

#{identation}call_validate_api(connection, package, params)
#{identation('remove')}end\n)
    end

    def level_alignment(data)
      splited_path = data.path.split('/')
      splited_path.shift

      splited_path.each { identation('add') }
    end
  end
end
