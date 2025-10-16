require 'json'
require 'yaml'
require 'openssl'
require 'excon'
require 'pry'

require_relative '../templates/commons_template'

Dir[File.join(File.dirname(__FILE__), '../templates/*.rb')].sort.each { |file| require file }
Dir[File.join(File.dirname(__FILE__), '../model/*.rb')].sort.each { |file| require file }

OpenSSL::SSL.send(:remove_const, :VERIFY_PEER)
OpenSSL::SSL.const_set(:VERIFY_PEER, OpenSSL::SSL::VERIFY_NONE)
