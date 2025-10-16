module Templates
  class UrlConfigTemplate
    include CommonsTemplate

    attr_accessor :file_content, :file_path, :file_name, :splited_path

    def initialize(file_path, file_name)
      self.file_path = file_path
      self.file_name = file_name
      self.file_content = YAML.load_file("#{file_path}/#{file_name}")
    end

    def build(data)
      return if configured?(data)

      schema = data.doc['schemes'] || 'https'
      schema = schema.first if schema.is_a?(Array)
    
       value =  "Endereco IP" #data.doc['servers']["url"] ? data.doc['servers']["url"] : 'TODO: url'
       file_content['urls'] = Hash.new if file_content['urls'].eql?(nil)
       file_content['urls'][data.api_name] = value
      
    end

    def write
      if file_content == YAML.load_file("#{file_path}/#{file_name}")
        puts 'url não foi gerada ou alterada'
      else
        update_file(file_path, file_name, file_content.to_yaml)
        puts 'url foi gerada ou alterada'
      end
    end

    def configured?(data)
        file_content['urls'].eql?(nil) ?  false : file_content['urls'].key?(data.api_name)
    end
  end
end
