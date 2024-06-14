Dado('que acesso a area do usuario') do
  home.iconePerfil.clicar(90)
end

Quando('realizo login com o usuário {string}') do |usuario|
  @usuario =  login.fazer_login(usuario)
end

Entao('sou redirecionado para a home') do
  step('estar na home do APP')
end

Quando('submeto minhas credenciais com {string}') do |usuario|
  login.fazer_login(usuario)
end

Então('vejo a mensagem de alerta: {string}') do |msg_erro|
  expect(login.msgErro.esperar.texto).to eql msg_erro 
end

Quando('realizo o logout') do
  steps %(
    Dado estar na home do APP
    Quando clico no icone de configuração
    Então sou redirecionado para a tela de configuração
    )
    menu.btnLogout.clicar
end

Então('vizualizo a area do login') do
  steps %(
    Dado estar na home do APP
    Quando clico no icone de perfil
    Então sou redirecionado para a tela de login
    )
end

Quando('clico no link esqueci minha senha') do
  login.entendi
  login.linkEsqueciMinhaSenha.scroll.clicar
end

E('adiciono o email {string}') do |email|
  esqueci_minha_senha.emailEsqueciSenha.digitar(USERS[:"#{email}"][:email])
end

Quando('clico em redefinir a senha') do
  esqueci_minha_senha.btnRedefinirSenha.clicar
end

Quando('clico em continuar') do
  esqueci_minha_senha.btnContinuar.clicar(90)
end

Então('sou redirecionado para a tela de redefinicao de senha') do
  expect(esqueci_minha_senha.telaCodigo.esperar.texto).to eql "Digite o código:"
end

Quando('clico no link fale com a gente') do
  login.link_fale_com_a_gente.scroll.clicar(5)
end

Então('sou redirecionado para a o atendimento online') do
  expect(login.copi.esperar.texto).to eql('Chatbot - Droz')
end

Quando('realizo login google com o usuário {string}') do |usu|
  login.fazer_login_pelo_google(usu)
end

Quando('realizo login facebook com o usuário {string}') do |usu|
  login.fazer_login_pelo_facebook(usu)
end

Quando('realizo login icloud com o usuário {string}') do |usu|
   # Write code here that turns the phrase above into concrete actions
end

Quando('realizo login com o usuário {string} via login google') do |usuario|
  login.fazer_login_pelo_google(USERS[:"#{usuario}"][:email], USERS[:"#{usuario}"][:senha])
end

