module ApiCommons
  def call_with_retry(try = 6, endpoint = @endpoint_name, &block)
    caller_locations.join.include?('aggregate_failures') ? retry_with_aggregate(try, endpoint, &block) : retry_without_aggregate(try, &block)
  end

  def retry_with_aggregate(try, endpoint, &block)
    failures = aggregate_failures(&block)
    raise_exception_if_failure(failures)
  rescue RuntimeError, NoMethodError, RSpec::Expectations::ExpectationNotMetError, RSpec::Expectations::MultipleExpectationsNotMetError => error
    puts "Erro: #{error}"
    try -= 1
    if try.positive?
      puts "Retrying validation... #{try} times left\n"
      sleep 1
      step "chamar o endpoint #{endpoint}"
      aggregate_failures&.clear
      retry
    end
  end

  def raise_exception_if_failure(failures)
    raise failures.first if failures&.size&.positive?
  end

  def retry_without_aggregate(try)
    yield
  rescue RuntimeError, NoMethodError, RSpec::Expectations::ExpectationNotMetError => error
    puts "Erro: #{error}"
    try -= 1
    if try.positive?
      puts "Retrying... #{try} times left"
      sleep 1
      retry
    end
    raise error
  end

  def validate_call_endpoint_steps_arguments(endpoint, type, ignore_steps, data_table)

    validade_endpoint_consistency(endpoint)
    unless ignore_steps.empty?
      raise 'O tipo do passo deve ser um Array'unless ignore_steps.is_a? Array
      raise 'Tipo de passo não esperado. Use: \'Dado\', \'Quando\' e \'Então\''unless ignore_steps.grep(/Dado|Quando|Então/).any?
    end
    validate_datatable_argument(data_table)
    raise 'Endpoint name not expected' if (/.*_.*\..*/ =~ endpoint).nil?
    raise 'Scenario type not expected. Use: \'positivo\', \'negativo\' or \'validacao\'' if (/positivo|negativo|validacao/ =~ type).nil?
  end

  def validate_datatable_argument(data_table)
    raise 'DataTable type not expected. Use: \'Cucumber::MultilineArgument::DataTable\' or \'Hash\'' unless (data_table.is_a? Cucumber::MultilineArgument::DataTable) || (data_table.is_a? Hash) || (data_table.is_a? Array)
  end

  def validade_endpoint_consistency(endpoint)
    return if instance_variable_get("@#{endpoint.tr('.', '_')}").nil?

    puts "\n*** Method call_endpoint_steps not executed. #{endpoint} already has data generated ***"
  end
end
