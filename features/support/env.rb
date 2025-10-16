Dir[File.join(File.dirname(__FILE__), 'commons/*.rb')].sort.each { |file| require_relative file }

require 'csv'
require 'write_xlsx'
require 'cpf_faker'
require 'cucumber'
require 'dbi'
require 'excon'
require 'faker'
require 'faraday'
require 'faraday_middleware'
require 'mime/types'
require 'pry'
require 'report_builder'
require 'rspec'
require 'net/sftp'
require 'net/ssh'
require 'holidays'
require 'httparty'

# service gems
require 'documentos_br'
require 'os'
require 'savon'
require 'parallel_tests'

ENVIRONMENT_TYPE = ENV.fetch('ENVIRONMENT_TYPE', nil) unless defined?(ENVIRONMENT_TYPE)
NEW_DATA_DIR = "#{File.dirname(__FILE__)}/data".freeze
NEW_DATA_FILES_DIR = "#{NEW_DATA_DIR}/files".freeze

API_CONFIG = YAML.load_file("#{File.dirname(__FILE__)}/config/#{ENVIRONMENT_TYPE}.yaml")
API_DATA = YAML.load_file("#{File.dirname(__FILE__)}/data/#{ENVIRONMENT_TYPE}.yaml")
API_ENV_DATA_NEW = YAML.load_file("#{NEW_DATA_DIR}/#{ENVIRONMENT_TYPE}.yaml")
EXCON_LOG = ENV['EXCON_LOG'].eql?('true')
LOCAL = ENV['LOCAL'].eql?('true')
MOCK = ENV['MOCK'].eql?('true')
GENERIC_MOCK = ENV['GENERIC_MOCK'].eql?('true')
MOCK_LIST = ENV.fetch('MOCK_LIST', nil)&.split(',') || []

INGRESS_TESTING = 'ingress_testing'.freeze
API_GATEWAY_TESTING = 'api_gateway_testing'.freeze
INTEGRATION_TESTING = 'integration_testing'.freeze

ParameterType(
  name: 'tipo',
  regexp: /positivo|negativo|validacao/,
  transformer: ->(type) { type }
)
