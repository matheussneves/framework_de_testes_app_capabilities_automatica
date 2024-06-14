Dado('filtro um veiculo {string}') do |profile|
  filtro.filtrar(profile)
  quero_comprar.btnVerFavoritos.esperar(20)
  exists(pre_check = 0, post_check = 1) {  android? ? execute_script('mobile: scrollGesture', {'left': (window_size[:width] / 2), 'top': (quero_comprar.bottomsheetfavoritos.buscar.location.y + 30), 'width': (window_size[:width] / 2), 'height': (window_size[:height]), 'direction': 'up', 'percent': 1.0}) : execute_script('mobile: dragFromToForDuration', {'fromX': (window_size[:width] / 2), 'fromY': (quero_comprar.bottomsheetfavoritos.buscar.location.y), 'toX': (window_size[:width] / 2), 'toY': (window_size[:height]), 'duration': 0.1}) }
end

Quando('clico no botão {string}') do |botao|
  case botao
    when 'Compartilhar'
      detalhes_do_anuncio.compartilhar.clicar(10)
    when 'Telefone', 'whatsapp'
      detalhes_do_anuncio.btnchamada.clicar(10)
      fechar_popup
      detalhes_do_anuncio.numtelefone.clicar if detalhes_do_anuncio.numtelefone.esperar(5).visivel?
    when 'Enviar mensagem'
      detalhes_do_anuncio.btnenviarmensagem.clicar(10)
    when 'Ver anúncios deste vendedor'
      detalhes_do_anuncio.btnveranunciosdestevendedor.clicar
    when "Denunciar este anúncio"
      botao.type_text.scroll
      botao.type_text.clicar
    when "Desfavoritar"
      detalhes_do_anuncio.favorito.clicar(10)
    else
      detalhes_do_anuncio.favorito.clicar(10)
  end
end

Então('vejo o pop up {string}') do |popup|
  expect(popup.type_text.esperar.visivel?).to be_truthy
end

Então('vejo a opção {string}') do |opcao|
  expect(opcao.type_text.esperar.visivel?).to be_truthy
  sleep(3)
end

Quando('clico na opção {string}') do |opcao|
  detalhes_do_anuncio.popupdesfavoritar.clicar
end

Então('vejo o bottom sheet de compartilhamento nativo do device') do
  expect(detalhes_do_anuncio.nativocompartilhar.esperar.visivel?).to be_truthy
end

Quando('clico no botão {string} do {string}') do |botao, local|
 local.eql?("anúncio") ? detalhes_do_anuncio.btnverparcela.clicar(10) :  exists(pre_check = 0, post_check = 1) {  2.times { detalhes_do_anuncio.btnverparcelafooter.clicar(10) } }
end

Quando('sou redirecionado para a tela de Dados pessoais no fluxo de compra') do
  detalhes_do_anuncio.dadospessoais.esperar(10)
end

Quando('clico na aba {string}') do |aba|
  aba.type_text.clicar
end

Então('valido o carrossel de fotos e a exibição de todas as fotos') do
 detalhes_do_anuncio.imagem.esperar
 quant_img = detalhes_do_anuncio.dotimg.buscar_elementos
 quant_img.last.selected? == false
 detalhes_do_anuncio.imagem.swipe_lateral(quant_img.length)
 expect(quant_img.last['encontrado'].selected?).to be_truthy
end

Quando('clico em uma foto') do
  detalhes_do_anuncio.imagem.clicar
end

Então('a foto é exibida em tela cheia') do
 detalhes_do_anuncio.imgfull.esperar
 quant_img = detalhes_do_anuncio.dotimgfull.buscar_elementos
 detalhes_do_anuncio.imgfull.swipe_lateral(quant_img.length)
 expect(quant_img.last.displayed?).to be_truthy
end

Quando('clico em X') do
 detalhes_do_anuncio.imgclose.clicar
end

Então('é retornado a tela de detalhes do anúncio') do
  expect(detalhes_do_anuncio.imagem.esperar.visivel?).to be_truthy
end

Quando('dou {int} click duplo na foto em tela cheia') do |num|
  detalhes_do_anuncio.imgfull.esperar
  num.times { execute_script('mobile: doubleClickGesture', {'x': (window_size[:width] / 2), 'y': (window_size[:height] / 2) }) }
end

Então('a foto é exibida com zoom {string}') do |zoom|
  expect(detalhes_do_anuncio.imgfull.esperar.visivel?).to be_truthy
end

Então('a foto é exibida com tamanho natural') do
  expect(detalhes_do_anuncio.imgfull.esperar.visivel?).to be_truthy
end

Quando('dou zoom com dois dedos') do
  execute_script('mobile: pinchOpenGesture', {'elementId': detalhes_do_anuncio.imgfull.buscar,'percent': 0.75})
end

Então('a foto é exibida com zoom') do
  expect(detalhes_do_anuncio.imgfull.esperar.visivel?).to be_truthy
end

Então('são exibidos os componentes de titulo, subtitulo, preço e dados do veiculo corretamente') do
  aggregate_failures do
    expect(detalhes_do_anuncio.lbltitulo.esperar.visivel?).to be_truthy
    expect(detalhes_do_anuncio.lblversao.scroll.visivel?).to be_truthy
    expect(detalhes_do_anuncio.lblvalor.scroll.visivel?).to be_truthy
    expect(detalhes_do_anuncio.lblcambio.scroll.visivel?).to be_truthy
    expect(detalhes_do_anuncio.lblcidade.scroll.visivel?).to be_truthy
    expect(detalhes_do_anuncio.lblano.scroll.visivel?).to be_truthy
    expect(detalhes_do_anuncio.lblkm.scroll.visivel?).to be_truthy
    expect(detalhes_do_anuncio.lblcor.scroll.visivel?).to be_truthy
    expect(detalhes_do_anuncio.lblcarroceria.scroll.visivel?).to be_truthy
    expect(detalhes_do_anuncio.lblportas.scroll.visivel?).to be_truthy
    expect(detalhes_do_anuncio.lblcambio.scroll.visivel?).to be_truthy
    expect(detalhes_do_anuncio.lblblindado.scroll.visivel?).to be_truthy
    expect(detalhes_do_anuncio.lblfinalplaca.scroll.visivel?).to be_truthy
    expect(detalhes_do_anuncio.lblcombustivel.scroll.visivel?).to be_truthy
    expect(detalhes_do_anuncio.lblblindado.scroll.visivel?).to be_truthy
  end
end

Então('são exibidos os itens do veículo corretamente') do
  expect(detalhes_do_anuncio.cmpitensdoveiculo.scroll.visivel?).to be_truthy
end

Então('é exibido o componente de videochamada corretamente') do
  detalhes_do_anuncio.lblvideochamada.scroll
  expect(detalhes_do_anuncio.btnvideochamada.esperar.visivel?).to be_truthy
end

Então('são exibidos os componentes de imagem, nome do vendedor e localidade corretamente') do
  aggregate_failures do
    expect(detalhes_do_anuncio.fotovendedor.esperar.visivel?).to be_truthy
    expect(detalhes_do_anuncio.lblnomevendedor.esperar.visivel?).to be_truthy
    expect(detalhes_do_anuncio.lbllocalvendedor.esperar.visivel?).to be_truthy
    expect(detalhes_do_anuncio.lblconquistas.esperar.visivel?).to be_truthy
    expect(detalhes_do_anuncio.btnveranunciosdestevendedor.esperar.visivel?).to be_truthy
  end
end

Quando('clico combobox de horario de atendimento') do
 detalhes_do_anuncio.horarioatendimento.clicar 
end

Então('é exibido os horarios de atendimento do vendedor') do
  expect('Sábado'.type_text.esperar.visivel?).to be_truthy
end

Então('é exibido o componentes de conquistas corretamente') do
  expect(detalhes_do_anuncio.lblconquistas.esperar.visivel?).to be_truthy
end

Então('sou redirecionado para a tela de {string} exibindo apenas os anuncios do vendedor') do |tela|
  expect('Pesquisa'.type_text.esperar.visivel?).to be_truthy
end

Então('é exibido o componente {string}') do |componente|
  pending
end

Quando('clico em Mais Detalhes') do
  detalhes_do_anuncio.maisdetalhes.clicar
end

Quando('clico em visualizar laudo') do
  detalhes_do_anuncio.btnVisualizarLauco.clicar
end

Então('valido o laudo vistoriado do veiculo') do
  detalhes_do_anuncio.tituloLaudoVistoriado.buscar
end

Quando('clico Saiba Mais') do
  detalhes_do_anuncio.saibaMais.clicar
end

Entao('devo ser direcionado para cockpit laudo vistoriado') do
  detalhes_do_anuncio.validarCokpit.buscar
end

Quando('clico em Ver Visao360') do
  detalhes_do_anuncio.ver360.clicar
end

Então('valido as fotos e video no visao360') do
  detalhes_do_anuncio.fechar360.buscar
end

Quando('instalo o app {string}') do |app|
  whatsapp = "./config/app/#{PLATFORM.downcase}/#{android? ? 'whatsapp.apk' : "whatsapp.#{real? ? 'ipa' : 'app'}"}"
  whatsappbusiness = "./config/app/#{PLATFORM.downcase}/#{android? ? 'whatsappbusiness.apk' : "whatsappbusiness.#{real? ? 'ipa' : 'app'}"}"
  case app
  when "Whatsapp" then   android? ? execute_script('mobile: installApp', {'appPath': whatsapp }) : execute_script('mobile: installApp', {'app': whatsapp })
  when "Whatsapp Business" then android? ? execute_script('mobile: installApp', {'appPath': whatsappbusiness }) : execute_script('mobile: installApp', {'app': whatsappbusiness })
  when "Whatsapp e Whatsapp Business" 
    android? ? execute_script('mobile: installApp', {'appPath': whatsapp }) : execute_script('mobile: installApp', {'app': whatsapp })
    android? ? execute_script('mobile: installApp', {'appPath': whatsappbusiness }) : execute_script('mobile: installApp', {'app': whatsappbusiness })
  end
end

Então('sou redirecionado para o app {string}') do |app|
  case app
  when "Whatsapp Business"
    wait_for_until(4) {(execute_script 'mobile: getCurrentPackage').eql?("com.whatsapp.w4b")}
    expect(execute_script 'mobile: getCurrentPackage').to eql("com.whatsapp.w4b")
  when "Sem app"
    wait_for_until(4) {(execute_script 'mobile: getCurrentPackage').include?('webmotors')}
    expect(execute_script 'mobile: getCurrentPackage').to include("webmotors")
  else "Whatsapp"
    wait_for_until(4) {(execute_script 'mobile: getCurrentPackage').eql?('com.whatsapp')}
    expect(execute_script 'mobile: getCurrentPackage').to eql('com.whatsapp')
  end
  if ios?
    execute_script('mobile: removeApp', {'bundleId': 'net.whatsapp.WhatsApp'}) if execute_script('mobile: isAppInstalled', 'bundleId': 'net.whatsapp.WhatsApp')
    execute_script('mobile: removeApp', {'bundleId': 'net.whatsapp.WhatsAppSMB'}) if execute_script('mobile: isAppInstalled', 'bundleId': 'net.whatsapp.WhatsAppSMB')
  else
    execute_script('mobile: removeApp', {'appId': "com.whatsapp.w4b" })  if execute_script('mobile: isAppInstalled', 'appId': "com.whatsapp.w4b")
    execute_script('mobile: removeApp', {'appId': 'com.whatsapp' })  if execute_script('mobile: isAppInstalled', 'appId': 'com.whatsapp')
  end
end

Então('vejo o icone de telefone habilitado') do
  detalhes_do_anuncio.btnchamada.clicar
  wait_for_until(4) {(execute_script 'mobile: getCurrentPackage').eql?('com.android.dialer')}
  expect(execute_script 'mobile: getCurrentPackage').to eql('com.android.dialer')
end

Então('vejo o icone de telefone desabilitado') do
  detalhes_do_anuncio.btnchamada.clicar
  wait_for_until(4) {(execute_script 'mobile: getCurrentPackage').eql?('com.android.dialer')}
  expect(execute_script 'mobile: getCurrentPackage').to eql('hands.android.webmotors.debug')
end