E('que clico no anuncio dentro da conversa') do
  chat.btnTelefone.esperar(10)
  chat.btnDetalheAnuncio.clicar(90)
end

E('que clico no anuncio dentro da conversa - vendendo') do
  step('que clico na conversa - vendendo')
  step('que clico no anuncio dentro da conversa')
#  chat.sair_pop_atencao
end

Então('valido as conversas da aba vendendo') do 
  expect(chat.iconeTelaChat.esperar.visivel?).to be_truthy
end 

Quando('envio uma mensagem pronta ao vendedor {string}') do |msg|
  chat.bntOpcaoMensagem.clicar(90)
  chat.btnEnviarMensagem.clicar(90)
end 

Quando('envio uma mensagem digitada ao vendedor {string}') do |msg|
  chat.enviar_mensagem_digitada(msg)
end

Então('visualizo a mensagem enviada na conversa - comprando {string}') do |msg|
  expect(chat.itemMensagemEnviada.esperar(90).visivel?).to be_truthy
end

Então('visualizo a mensagem digitada enviada na conversa - comprando {string}') do |msg|
  expect(chat.itemMensagemEnviadaDitadaComprando.esperar(90)).to be_truthy
end

Quando('envio uma mensagem pronta ao comprador') do
  chat.bntOpcaoMensagem.clicar(90)
  chat.btnEnviarMensagem.clicar(90)
end 

Quando('envio uma mensagem digitada ao comprador {string}') do |msg|
  chat.enviar_mensagem_digitada(msg)
end 

Então('visualizo a mensagem enviada na conversa - vendendo {string}') do |msg|
  expect(msg.type_text.esperar(90).visivel?).to be_truthy
end 

Então('visualizo a mensagem digitada enviada na conversa - vendendo {string}') do |msg|
  expect(msg.type_text.esperar(90).visivel?).to be_truthy
end 

Então('sou direcionado ao Detalhes do anúncio') do
  expect(quero_comprar.tituloTelaDA.esperar(90).visivel?).to be_truthy
end

Quando('que clico na conversa') do
  chat.btnConversaChat.esperar.clicar
  wait_for_until(20) {!'In progress'.type_id.buscar} if ios?
end

Quando('que clico na conversa - vendendo') do
  chat.btnConversaChatvendendo.esperar(50).clicar
end

Quando('clico no menu ao lado do telefone') do
  chat.btnMore.clicar(30)
end

Quando('clico em ver anuncio chat') do
  chat.clicarVerAnuncio.clicar
end

Quando('clico no telefone ao lado do nome') do
  chat.btnTelefone.clicar
end

Então('as opcoes de contatos irao aparecer') do
  expect(chat.escolherContato.esperar(90).visivel?).to be_truthy
end

Quando('clico na aba de vendedor') do
  chat.abaVendedor.esperar.clicar
end