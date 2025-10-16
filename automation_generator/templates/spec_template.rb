module Templates
  class SpecTemplate
    include CommonsTemplate

    attr_accessor :file_content, :file_path, :file_name, :last_module, :clazz

    def initialize(file_path, file_name)
      self.file_path = file_path
      self.file_name = file_name

      create_file(file_path, file_name)
      self.file_content = load_file(file_path, file_name)
    end

    def build(data)
      definition = build_def(data)

      return if file_content.include?(clazz)

      file_content.insert(-1, definition)
    end

    def write
      if file_content == load_file(file_path, file_name)
        puts 'spec não foi gerada ou alterada'
      else
        update_file(file_path, file_name, file_content)
        puts 'spec foi gerada ou alterada'
      end
    end

    private

    def build_def(data)
      splited_path = data.path.split('/').map { |segment| segment.tr('.', '_') }
      splited_path.shift
      splited_path = normalize_path(splited_path)

      build_clazz(splited_path, data.api_name)

      %(#{"\n" unless file_content.empty?}def #{splited_path.join('_')}
  #{clazz}
end
)
    end

    def build_clazz(splited_path, api_name)
      self.clazz = ''
      splited_path.each_with_index do |path, index|
        clazz << '::' unless index.zero?
        clazz << first_upcase(path)
        clazz << "Class.new(get_base_uri('#{api_name}'))" if index.eql?(splited_path.size - 1)
      end
    end
  end
end
