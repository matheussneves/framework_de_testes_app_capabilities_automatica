def LEMMIT_API_v1_healthcheck
  LEMMIT_API::V1::HealthcheckClass.new(get_base_uri('LEMMIT_API'))
end

def LEMMIT_API_v1_document
  LEMMIT_API::V1::DocumentClass.new(get_base_uri('LEMMIT_API'))
end

def LEMMIT_API_v2_document
  LEMMIT_API::V2::DocumentClass.new(get_base_uri('LEMMIT_API'))
end
