module CommonsTemplate
  def create_file(file_path, file_name, content = '')
    return if File.exist?("#{file_path}/#{file_name}")

    FileUtils.mkdir_p(file_path)

    write_file(file_path, file_name, content)
  end

  def update_file(file_path, file_name, content)
    write_file(file_path, file_name, content)
  end

  def load_file(file_path, file_name)
    File.read("#{file_path}/#{file_name}", encoding: 'utf-8').encode(universal_newline: true)
  end

  def identation(option = nil)
    @identation_level = case option
                        when 'add' then @identation_level + 1
                        when 'remove' then @identation_level - 1
                        else @identation_level
                        end

    identation = ''
    @identation_level.times do
      identation.concat('  ')
    end
    identation
  end

  def snake_case(str)
    str.gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
       .gsub(/([a-z\d])([A-Z])/, '\1_\2')
       .gsub(/\s/, '_')
       .downcase
  end

  def first_upcase(str)
    if /\A\d+\z/.match(str[0]).nil?
      encode_hyphen(str[0, 1].upcase + str[1..])
    else
      encode_dot(str)
    end
  end

  def normalize_path(splited_path)
    splited_path.map! do |item|
      if /\A\d+\z/.match(item[0]).nil?
        encode_hyphen(item)
      else
        encode_dot(item)
      end
    end
  end

  def encode_hyphen(str)
    str.gsub('-', '_h_')
  end

  def encode_brace(str)
    str&.tr('{', '')&.tr('}', '')
  end

  def encode_endpoint(str)
    str = encode_hyphen(str)
    str = encode_dot(str)
    encode_brace(str)
  end

  def encode_api_name(str)
    str = encode_separator(str)
    str = encode_hyphen(str)
    encode_space(str)
  end

  private

  def encode_separator(str)
    str.gsub(' - ', '_s_')
  end

  def encode_space(str)
    str.tr(' ', '_')
  end

  def encode_dot(str)
    str.gsub('.', '_d_')
  end

  def write_file(file_path, file_name, content)
    File.open("#{file_path}/#{file_name}", 'w') do |file|
      file.write(content)
      file.close
    end
  end

  def comment_swagger_error(item, content, aux)
    message = <<~SCRIPT
      *********************
      Valor "#{aux}" não suportado:
      #{item}
      Por favor, valide o Swagger
      *********************
    SCRIPT

    puts message
    content << message
  end
end
