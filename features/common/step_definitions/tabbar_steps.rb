Quando('estou na {string} no status {string} com perfil {string}') do |pagina, status, profile|
    if status.downcase.eql?('logado')
        steps %(
        Dado estar na home do APP
        Quando clico no icone 'Menu'
        Quando clico em entrar
        Então sou redirecionado para a tela de login
        Quando realizo login com o usuário '#{profile}'
        Quando clico no icone 'Início'
        Dado estar na home do APP
    )
    end
    tabbar.buscar.clicar if pagina.eql?('Busca')
end
  
Quando('clico no icone {string}') do |icone|
    case icone
    when 'Início' then tabbar.inicio.clicar(90)
    when 'Buscar' then tabbar.buscar.clicar(90)
    when 'Favoritos' then tabbar.favoritos.clicar(90)
    when 'Menu' then tabbar.menu.clicar(90)
    when 'Serviços' then tabbar.servicos.clicar(90)
    when 'Início' then tabbar.home.clicar(90)
    end
end
  
Então('sou redirecionado para a tela de {string}') do |tela|
    aggregate_failures do
        case tela
        when 'Inicio'
            step('estar na home do APP')
        when 'Menu'
            expect(tabbar.menu.esperar(50).visivel?).to be_truthy
        when 'Menu logado'
            expect('Minha conta'.type_accessibility_id.esperar(10).visivel?).to be_truthy
        when 'Buscar'
            expect('Filtrar'.type_text.esperar_elemento_visivel(10).visivel?).to be_truthy
        when 'Login'
            step('sou redirecionado para a tela de login')
        when 'Favoritos'
            expect(tela.type_text.esperar(10).visivel?).to be_truthy
        when 'Chat'
            expect(chat.lbl_chat.esperar(20).visivel?).to be_truthy
        when 'Serviços'
            expect('Serviços'.type_accessibility_id.esperar(10).visivel?).to be_truthy
        when 'Telefone'
           exists(pre_check = 0, post_check = 1) { 'Cancelar'.type_text.esperar(4) }
           expect(real? ? 'Cancelar'.type_text.esperar(10).visivel? : detalhes_do_anuncio.telefone.esperar(10).visivel?).to be_truthy
        when 'Enviar Proposta'
            expect(quero_comprar.checkBox.esperar(10).visivel?).to be_truthy
        when 'agendamendo de videochamada'
            expect('Videochamada'.type_text.esperar.visivel?).to be_truthy
        when 'Denunciar anúncio'
            expect(tela.type_text.esperar(50).visivel?).to be_truthy
        when "discagem do celular" 
            wait_for_until(10) {(execute_script 'mobile: getCurrentPackage').eql?('com.android.dialer')}
            expect(execute_script 'mobile: getCurrentPackage').to eql('com.android.dialer')
        end
    end
end