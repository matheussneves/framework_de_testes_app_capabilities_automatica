module LEMMIT_API
  module V1
    class DocumentClass
      include ApiCommons

      attr_accessor :base_uri

      def get_document(params)
        connection = get_new_connection(base_uri, params.header.to_h)
        package = build_package(__method__, self.class.name, params)

        call_validate_api(connection, package, params)
      end

      def initialize(base_uri)
        self.base_uri = base_uri
      end
    end
  end
end

World(LEMMIT_API::V1)
