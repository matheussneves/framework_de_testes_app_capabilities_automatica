Dado('estar na home do APP') do
  home.iconechat.esperar(30)
end

Quando('clico no icone de configuração') do
  home.iconechat.clicar
end

Então('sou redirecionado para a tela de configuração') do
  expect(menu.lbl_titulo.esperar.visivel?).to be_truthy
end

Dado('clico no botão Chat') do
  home.iconechat.clicar(10)
end

Quando('clico no icone de perfil') do
  home.iconePerfil.clicar if home.iconePerfil.esperar(30).visivel?
end 

Então('sou redirecionado para a tela de login') do
  login.entendi
  expect(login.inputEmail.esperar(120).visivel?).to be_truthy
end

Quando('clico no banner {string}') do |banner|
  (android? ? banner.type_text : banner.type_accessibility_id).esperar(180)
  (android? ? banner.type_text : banner.type_accessibility_id).clicar(180)
end

Então('sou redirecionado para {string}') do |destino|
  aggregate_failures do
    case destino
    when "tela de login"
      step('sou redirecionado para a tela de login')
    when "site WM1"
      expect(wm1.lbl_titulo.esperar.visivel?).to be_truthy
    when "tela de busca com filtro visão360"
      expect(pesquisa.btn_ver_favoritos.esperar.visivel?).to be_truthy
    when "site webmotors catalogo"
      expect(home.web_suv_catalogo.esperar.visivel?).to be_truthy unless "Chrome".type_text.esperar(10)
    when "site Notícia WM1"
      expect( wm1.lbl_titulo_noticias.esperar.visivel?).to be_truthy
    when "tela de serviços"
      expect('Serviços'.type_accessibility_id.esperar.visivel?).to be_truthy
    when 'Meus Anúncios'
      expect('Meus anúncios'.type_text.esperar(60).visivel?).to be_truthy
    when 'Favoritos'
      expect('Ordenado por: Salvos recentemente'.type_text.esperar(60).visivel?).to be_truthy
    end
  end
end

Quando('clico no botão {string} do carrossel') do |botao|
  swipe_lateral_por_elemento(home.btn_carrossel_meu_credito_pre_aprovado, botao.type_accessibility_id, 60).clicar(10)
end

Então('sou redirecionado para a tela {string}') do |tela|
  aggregate_failures do
    case tela
    when 'componente Meu crédito pré-aprovado'
      expect( home.comp_meu_credito_pre_aprovado.esperar.visivel?).to be_truthy
    when 'tela de login'
      step('sou redirecionado para a tela de login')
    when 'tela de busca'
      expect('Carros'.type_text.esperar.visivel?).to be_truthy
    when 'site Notícia WM1'
      expect(wm1.lbl_titulo.esperar.visivel?).to be_truthy
    when 'tela tabela webmotors'
      expect(tabela_webmotors.lbl_titulo.esperar.visivel?).to be_truthy
    when 'site webmotors financia'
      expect(home.url_navegador.esperar.visivel?).to be_truthy unless "Chrome".type_text.esperar
    when 'tela de criação de anuncio'
      expect((android? ? 'Anunciar meu veículo'.type_text : 'ANUNCIAR VEÍCULO'.type_id).esperar(60).visivel?).to be_truthy
    when 'Meus anúncios'
      expect('Meus anúncios'.type_text.esperar(60).visivel?).to be_truthy
    when 'tela de Serviços'
      expect('Serviços'.type_text.esperar(60).visivel?).to be_truthy
    when 'tela de Favoritos'
      expect('Favoritos'.type_text.esperar(60).visivel?).to be_truthy
    end
  end
end

Quando('vejo o componente Meu crédito pré-aprovado') do
  steps %(
            Quando clico no botão 'Meu crédito pré aprovado' do carrossel
            Então sou redirecionado para a tela 'componente Meu crédito pré-aprovado'
          )
end

Quando('preencho o campo CPF com CPF {string} com o checkbox Aceito os termos {string}') do |cpf, cbox|
  case cpf
  when "Com valor aprovado"
    cpf = '44823413806'
  when "Sem valor aprovado"
    cpf = '44823413806'
  when "Invalido"
    cpf = '12345678901'          
  when "Vazio"             
    cpf = ' '
  end 
  home.comp_txtbox_cpf.digitar(cpf)
  home.comp_chekbox_termos.clicar if cbox.eql?('Preenchido')
  'Descobrir crédito pré-aprovado'.type_text.clicar
end

Então('o APP {string}') do |acao|
  aggregate_failures do
    case acao
    when "Não habilita o botão descobrir crédito pré-aprovado"
      expect(home.comp_btn_descobrir_credito.buscar.enabled?).to be_falsey                                  
    when "Redireciona para a tela de busca com filtro de valor preenchido com o valor pré aprovado"
     #falta
    when "Redireciona para a tela de login"
      home.comp_btn_descobrir_credito.esperar.clicar
      step('sou redirecionado para a tela de login')                                                          
    when "Exibe mensagem CPF inválido"                                                                                                                        
      expect('CPF inválido'.type_text.esperar.visivel?).to be_truthy
    end
  end
end

Quando('clico no banner com a notícia {string}') do |noticia|
  noticia.type_text.scroll
  noticia.type_text.esperar
end

Então('sou redirecionando para a pagina da notícia') do
  expect((android? ? 'Notícias WM1'.type_text : 'Notícias WM1'.type_id).esperar.visivel?).to be_truthy
end

Quando('clico no botão Buscar veículo') do
  home.btnbuscarveiculo.scroll(100).clicar
end

Então('sou redirecionado para a tela de busca') do
  expect((quero_comprar.btn_filter.esperar(20).visivel? unless pesquisa.btn_ver_favoritos.esperar(10).visivel?)).to be_truthy
end

Quando('clico no botão do menu {string}') do |botao|
  (android? ? botao.type_text : botao.type_accessibility_id).scroll(150).clicar
end

Então('sou redirecionado para a {string}') do |tela|
  aggregate_failures do
    case tela
    when 'Login'
      step('sou redirecionado para a tela de login')
    when 'Últimas buscas'
      expect( (android? ? tela.type_text : tela.upcase.type_id).esperar(90).visivel?).to be_truthy
    when 'Pagina de Notícias'
      expect(wm1.lbl_titulo.esperar.visivel?).to be_truthy
    when 'Tabela Webmotors'
      expect(tabela_webmotors.lbl_titulo.esperar(90).visivel?).to be_truthy
    when "Catálogo 0km"
      expect((android? ? "Catálogo 0KM"  : tela).type_text.esperar(15).visivel?).to be_truthy
    end
  end 
end

Quando('clico botão Ver Serviços') do
  home.btnverservicos.scroll(150)
  home.btnverservicos.clicar(15)
end

Então('sou redirecionado para a tela de perfil do usuario') do
 expect((android? ? 'Minha Conta'.type_text: 'Minha conta'.type_id).esperar.visivel).to be_truthy
end

Então('sou redirecionado para a tela de Serviços') do
  expect('Serviços'.type_accessibility_id.esperar(60).visivel?).to be_truthy
end

Quando('clico') do
  puts 'clicou'
end

Então('sou') do
  expect(true).to be_falsey
end