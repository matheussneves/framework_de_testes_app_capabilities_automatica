$api_performance = {}

at_exit do
  File.open(File.join(File.dirname(__FILE__), "/../../reports/performance/api_performance_#{ENV.fetch('TEST_ENV_NUMBER', nil)}.json"), 'w') do |file|
    file.write(JSON.pretty_generate($api_performance))
    file.close
  end
end

Before do |scenario|
  initialize_testing_type(scenario)
  initialize_testing_tags(scenario)
end

private

