Dir[File.join(File.dirname(__FILE__), '../features/support/env.rb')].sort.each { |file| require file  }
Dir[File.join(File.dirname(__FILE__), '../features/support/**/*.rb')].sort.each { |file| require file unless file.include?('hooks.rb') }
Dir[File.join(File.dirname(__FILE__), '../features/clients/**/*.rb')].sort.each { |file| require file }
Dir[File.join(File.dirname(__FILE__), '../features/steps_definitions/**/*.rb')].sort.each { |file| require file }
