Dado('ter uma massa configurada do endpoint LEMMIT_API_v1_healthcheck.get para o cenário {tipo}') do |tipo|
  # Popular os parametros
  endpoint = OpenStruct.new
  endpoint.consumes = 'application/json'
  endpoint.produces = 'application/json'
  
  if tipo.eql?('negativo')
    # Criar logica para o cenario negativo
    endpoint.header = OpenStruct.new unless endpoint.header
    endpoint.header['fault'] = 'error_200'
  end

  @LEMMIT_API_v1_healthcheck_get = endpoint
end

Quando('chamar o endpoint LEMMIT_API_v1_healthcheck.get') do
  @LEMMIT_API_v1_healthcheck_get.response = LEMMIT_API_v1_healthcheck().get_healthcheck(@LEMMIT_API_v1_healthcheck_get)
rescue StandardError => error
  @LEMMIT_API_v1_healthcheck_get.error = error
ensure
  puts(@LEMMIT_API_v1_healthcheck_get.request_log, @LEMMIT_API_v1_healthcheck_get.response_log)
end

Então('validar o retorno do endpoint LEMMIT_API_v1_healthcheck.get para o cenário {tipo}') do |tipo|
  aggregate_failures do
    endpoint = @LEMMIT_API_v1_healthcheck_get
    if tipo.eql?('positivo')
      expect(endpoint.error).to be_nil


      # Fazer as validacoes necessarias para o cenario positivo
    else

      # Fazer as validacoes necessarias para o cenario negativo
    end
  end
end
