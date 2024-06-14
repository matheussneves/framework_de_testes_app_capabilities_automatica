['appium_lib', 'cucumber', 'documentos_br', 'faker', 'net/sftp', 'open3', 'parallel_tests', 'percentage', 'pry', 'cpf_cnpj', 'allure-cucumber', 'byebug',
 'rexml/document', 'rspec', 'rspec/expectations', 'rspec/core', 'rubygems', 'os', 'selenium-webdriver', 'savon', 'touch_action', 'json', 'active_support/all', 'report_builder', 'date','cpf_faker', 'excon'].each do |dependency| 
  require dependency
end #, 'httparty'
Dir[File.join(File.dirname(__FILE__), 'commons', '*.rb')].sort.each { |file| require_relative file }

Dir[File.join(File.dirname(__FILE__), '../../../testes-api/features/support/commons', '*.rb')].sort.each { |file| require_relative file }
Dir[File.join(File.dirname(__FILE__), 'page_helper', '*.rb')].sort.each { |file| require_relative file }
World(PageObjects)
# Allure
AllureCucumber.configure do |c|
 c.clean_results_directory = true
end
binding.pry
APP_ENV_DATA = YAML.load_file("#{Dir.pwd}/features/support/data/hk.yaml")
APP_STANDARD_DATA = YAML.load_file("#{Dir.pwd}/features/support/data/standard.yaml")
PLATFORM = ENV.fetch('PLATFORM', nil)
$wait = Selenium::WebDriver::Wait.new(timeout: 30)
Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8
TYPE_DEVICE = ENV['TYPE_DEVICE'].eql?(nil) ? 'virtual' : ENV['TYPE_DEVICE']
TIME_COMMAND = 30
DEVICE = load_local_devices(TYPE_DEVICE).first
DEVICE_ID = DEVICE.split(':::')[1]
DEVICE_NAME = DEVICE.split(':::').first
TEST_LOCATION = DEVICE.split(':::').last
PATH_APP = "./config/app/#{PLATFORM.downcase}/#{android? ? 'app-hk-release.apk' : "Webmotors.#{real? ? 'ipa' : 'app'}"}"
APP_CONFIG_DATA = YAML.load_file(File.expand_path(File.join('config', 'standard.yaml'), __dir__))
Appium::Driver.new(load_appium_capabilities, true)
Faker::Config.locale = 'pt-BR'

Appium.promote_appium_methods Object
