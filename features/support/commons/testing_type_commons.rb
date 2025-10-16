module ApiCommons
  attr_accessor :current_testing_type, :ingress_testing, :api_gateway_testing, :integration_testing

  def initialize_testing_type(scenario)
    load_testing_types(scenario)
    define_current_testing_type
  end

  def define_current_testing_type
    @current_testing_type = list_current_testing_type
  end

  private

  def load_testing_types(scenario)
    @ingress_testing = scenario.tags.any? { |item| item.name.eql?("@#{INGRESS_TESTING}") }
    @api_gateway_testing = scenario.tags.any? { |item| item.name.eql?("@#{API_GATEWAY_TESTING}") }
    @integration_testing = scenario.tags.any? { |item| item.name.eql?("@#{INTEGRATION_TESTING}") }
  end

  def list_current_testing_type
    if @integration_testing
      INTEGRATION_TESTING
    elsif @api_gateway_testing
      API_GATEWAY_TESTING
    else
      INGRESS_TESTING
    end
  end
end
