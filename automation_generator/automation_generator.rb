require_relative 'config/env'
require 'net/http'
require 'json'
require 'yaml'

module AutomationGenerator
  class << self
    include CommonsTemplate

    def run_automation_generator(url, api_name, endpoint)
      doc = download_swagger_doc(api_name, url)

      unless endpoint.eql?('all') || doc['paths'].key?(endpoint)
        puts "O endpoint '#{endpoint}' não foi encontrado na API '#{api_name}'"
        return
      end

      api_name = encode_api_name(doc['info']['title'])

      doc['paths'].each_key do |current_endpoint|
        (next unless current_endpoint.eql?(endpoint)) unless endpoint.eql?('all')

        puts "\nEndpoint: #{current_endpoint}"

        service_data = AutomationGenerator::Model::Api.new(api_name, current_endpoint, doc)
        path = service_data.doc['basePath']
        path = path.chop if path&.end_with?('/')
        service_data.path = "/#{api_name}#{encode_brace(path)}#{generate_path(service_data.normalized_endpoint)}"
        splited = service_data.path.split('/')
        service_data.system = splited[2]
        service_data.service_name = encode_hyphen(splited.last)

        set_version(service_data, splited)

        generate(service_data)
      end
    end

    private

    def generate(data)
      generate_client(data)
      generate_url_config(data)
      generate_spec(data)
      generate_steps(data)
      generate_gherkin(data)
    end

    def generate_client(data)
      splited_path = data.path.split('/')
      splited_path.pop

      path = normalize_path(splited_path)
      file_path = File.absolute_path("./features/clients/#{path.join('/')}")
      file_name = "#{data.service_name}.rb"

      client_template = Templates::ClientTemplate.new(file_path, file_name, data)
      client_template.build(data)
      client_template.write
    end

    def generate_url_config(data)
      file_path = File.absolute_path('./features/support/config')
      Dir["#{file_path}/*.yaml"].each do |item|
        file_name = File.basename(item)
        url_config_template = Templates::UrlConfigTemplate.new(file_path, file_name)
        url_config_template.build(data)
        url_config_template.write
      end
    end

    def generate_spec(data)
      file_path = File.absolute_path('./features/support/spec_helper')
      file_name = "#{data.api_name}_spec.rb"

      spec_template = Templates::SpecTemplate.new(file_path, file_name)
      spec_template.build(data)
      spec_template.write
    end

    def generate_steps(data)
      splited_path = data.path.split('/')
      splited_path.pop

      path = normalize_path(splited_path)
      file_path = File.absolute_path("./features/steps_definitions/#{path.join('/')}")
      file_name = "#{data.service_name}_steps.rb"

      steps_template = Templates::StepsTemplate.new(file_path, file_name, data)
      steps_template.build
      steps_template.write
    end

    def generate_gherkin(data)
      splited_path = data.path.split('/')
      splited_path.pop

      path = normalize_path(splited_path)
      file_path = File.absolute_path("./features/gherkins/#{path.join('/')}")
      file_name = "#{data.service_name}.feature"

      gherkin_template = Templates::GherkinTemplate.new(file_path, file_name, data)
      gherkin_template.build(data)
      gherkin_template.write
    end

    def generate_path(endpoint)
      service = endpoint.split('/')
      service.last.include?('{') ? service.pop : endpoint
    end

    def set_version(service_data, splited)
      splited.each do |item|
        version = item.tr('v', '').tr('.', '')
        service_data.version = item if /\A[-+]?\d+\z/ =~ version
      end
    end

    def download_swagger_doc(api_name, url)
      folder = 'automation_generator/documentations'
      FileUtils.mkdir_p(folder)
      path = "#{folder}/#{api_name.gsub('/', ' ')}@#{Time.now.strftime('%d_%m_%Y_%H_%M_%S')}.yaml"

     

      uri = URI.parse(url)
      response = Net::HTTP.get(uri)
      documentation = YAML.dump(JSON.parse(response))

      File.open(path, 'a') do |file|
        file.write(documentation)
        file.close
      end

      YAML.load_file(path)
    end
  end
end
