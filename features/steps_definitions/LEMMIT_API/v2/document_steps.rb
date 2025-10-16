Dado('ter uma massa configurada do endpoint LEMMIT_API_v2_document.get para o cenário {tipo}') do |tipo|
  # Popular os parametros
  endpoint = OpenStruct.new
  endpoint.consumes = 'application/json'
  endpoint.produces = 'application/json'
  
  endpoint.path = OpenStruct.new
  endpoint.path['document'] = '44823413806'

  if tipo.eql?('negativo')
    # Criar logica para o cenario negativo
    endpoint.header = OpenStruct.new unless endpoint.header
    endpoint.header['fault'] = 'error_422'
  end

  @LEMMIT_API_v2_document_get = endpoint
end

Quando('chamar o endpoint LEMMIT_API_v2_document.get') do
  @LEMMIT_API_v2_document_get.response = LEMMIT_API_v2_document().get_document(@LEMMIT_API_v2_document_get)
rescue StandardError => error
  @LEMMIT_API_v2_document_get.error = error
ensure
  puts(@LEMMIT_API_v2_document_get.request_log, @LEMMIT_API_v2_document_get.response_log)
end

Então('validar o retorno do endpoint LEMMIT_API_v2_document.get para o cenário {tipo}') do |tipo|
  aggregate_failures do
    endpoint = @LEMMIT_API_v2_document_get

    binding.pry
    if tipo.eql?('positivo')
      expect(endpoint.error).to be_nil


      # Fazer as validacoes necessarias para o cenario positivo
    else
      expect(endpoint.response.body['detail'].first['msg']).to eql('string')
      expect(endpoint.response.body['detail'].first['type']).to eql('string')

      # Fazer as validacoes necessarias para o cenario negativo
    end
  end
end
