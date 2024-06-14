# encoding: utf-8
#language: pt

@regression
@login

Funcionalidade: Login
  Eu como QA da Webmotors
  Quero garantir a qualidade dos cenários referente a login de usuário

  Contexto: Estar na home
     * estar na home do APP
     * clico no icone 'Menu'
     * clico em entrar
     * sou redirecionado para a tela de login
      
  @login_valido
  Cenário: Login Valido
    Quando realizo login com o usuário 'valido'
    Então sou redirecionado para a home

  @tentativa_login_com_dados_incorretos
  Esquema do Cenario: Validar login com dados incorretos
    Quando submeto minhas credenciais com "<usuario>"
    Então vejo a mensagem de alerta: "<mensagem_output>"

    Exemplos:
      | usuario                 | mensagem_output                |
      | senha_invalida          | E-mail ou senha inválidos! :(  |
      | email_invalido          | E-mail ou senha inválidos! :(  |
      | email_e_senha_invalidos | E-mail ou senha inválidos! :(  |
  
  @logout
  Cenário: Logout
    Quando realizo login com o usuário 'valido'
    E realizo o logout
    Então vizualizo a area do login
    
  @esqueci_minha_senha
  Cenário: Esqueci minha senha
    Quando clico no link esqueci minha senha
    E adiciono o email 'redefinir'
    E clico em redefinir a senha
    E clico em continuar
    Então sou redirecionado para a tela de redefinicao de senha


  @fale_com_a_gente
  Cenário: Validar link fale com a gente
      Quando clico no link fale com a gente
      Então sou redirecionado para a o atendimento online

  # @login_google
  # Cenário: Login Google Valido
  #   Quando realizo login google com o usuário 'valido'
  #   Então sou redirecionado para a home

  # @login_facebook
  # Cenário: Login Facebook Valido
  #   Quando realizo login facebook com o usuário 'valido'
  #   Então sou redirecionado para a home

  # @login_icloud
  # Cenário: Login Icloud Valido
  #   Quando realizo login icloud com o usuário 'valido'
  #   Então sou redirecionado para a home
