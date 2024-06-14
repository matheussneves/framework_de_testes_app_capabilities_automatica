Quando('clico na opcao quero comprar') do
  3.times { home.btnQueroComprar.clicar }
end

Dado('clico em ver anuncio') do
  quero_comprar.btnVerAnuncio.clicar(10)
end

Dado('clico em botao continuar') do
  quero_comprar.btnContinue.clicar(10)
end

Dado('entro em um anuncio') do
  quero_comprar.anuncio.clicar(20)
  fechar_popup(20)
end

E('preenchos os dados pessoais') do
  quero_comprar.nome.esperar
  quero_comprar.nome.digitar('Teste Teste')
  quero_comprar.email.digitar('testequerocomprar@gmail.com')
  quero_comprar.cel.digitar('11999558822')
  quero_comprar.dt_nasc.digitar('17/02/2000')
  quero_comprar.fin_CPF.digitar('32339388023')
  quero_comprar.localizacao.scroll
  quero_comprar.localizacao.clicar
  quero_comprar.est.clicar(5)
end

Dado('clico em ver parcelas novamente') do
  quero_comprar.driver.hide_keyboard()
  quero_comprar.btnSeeConditions.clicar
  quero_comprar.btnContinue.clicar
end

Dado('clico no bota para filtrar anuncio') do
  quero_comprar.btnfilter.clicar(10)
end

Dado('clico na opcao moto') do
  quero_comprar.btnMoto.clicar
  @aba = 'moto'
end

Dado('clico em ver parcelas') do
  quero_comprar.btnSimulate.clicar(10)
end

Dado('clico Aceito receber as ofertas') do
  scroll_por_elemento(quero_comprar.cbNews)
  quero_comprar.cbNews.clicar
end

Dado('clico em enviar mensagem') do
  quero_comprar.btnEnviarMsgDA.clicar(10)
end

Dado('preencho o campo de mensagem') do
  quero_comprar.nome.esperar(10)
  quero_comprar.nome.digitar('Teste Teste', true)
  quero_comprar.email.digitar('testequerocomprar@gmail.com', true)
  quero_comprar.tel.digitar('11999884465')
  quero_comprar.cmpMensagem.digitar('Mensagem do teste automatizado', true)
  close_keyboard if keyboard_is_present 
end

Dado('marcar o chebox para receber contatos') do
  close_keyboard
  quero_comprar.checkBox.clicar(10)
end

Quando('clico para enviar a mensagem') do
  quero_comprar.btnEnviarMsgEP.esperar.clicar(10)
end

E('clico no botao ver anuncio') do
  filtro.filtrar('astra')
  exists(pre_check = 0, post_check = 1) do
    quero_comprar.btnVerFavoritos.esperar(40)
    android? ? execute_script('mobile: scrollGesture', {'left': (window_size[:width] / 2), 'top': (quero_comprar.bottomsheetfavoritos.buscar.location.y + 20), 'width': (window_size[:width] / 2) , 'height': (window_size[:height]) , 'direction': 'up', 'percent': 1.0}) : execute_script('mobile: dragFromToForDuration', {'fromX': (window_size[:width] / 2) , 'fromY': (quero_comprar.bottomsheetfavoritos.buscar.location.y), 'toX': (window_size[:width] / 2) , 'toY': (window_size[:height]) , 'duration': 0.1})
  end
end

Dado('clico em ver parcelas moto') do
  quero_comprar.btnVerParcelasMotos.clicar(10)
end

Entao('valido que a mensagem foi enviada com sucesso') do
  expect(quero_comprar.propostaSucesso.esperar(10).texto).to eql("Sua proposta foi enviada com sucesso!")
end

Entao('valido a mensagem') do
  expect(quero_comprar.respostaMsgEnviada.esperar(10).visivel?).to eql("No momento não conseguimos retornar o valor das parcelas desse veículo.")
end

Então('vejo as parcelas para o meu CPF') do
  expect(quero_comprar.lblname.esperar(20).texto).to eql('Teste,')
end

Dado('marcar o chebox para receber contatos automatica') do
  quero_comprar.checkBox.clicar(10)
end
