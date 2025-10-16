module AutomationGenerator
  module Model
    class Api
      include CommonsTemplate

      attr_accessor :api_name, :endpoint, :normalized_endpoint, :doc, :path, :service_name, :system, :version

      def initialize(api_name, endpoint, doc)
        self.api_name = api_name
        self.endpoint = endpoint
        self.normalized_endpoint = encode_brace(endpoint)
        self.doc = doc
      end
    end
  end
end
