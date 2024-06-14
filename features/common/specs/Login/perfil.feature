# encoding: utf-8
#language: pt

@regression
@perfil

Funcionalidade: Perfil
  Eu como QA da Webmotors
  Quero garantir a qualidade dos cenários referente ao perfil do usuário

  Contexto: Estar na tela de login
     * estar na home do APP
     * clico no icone 'Menu'
     * clico em entrar
     * sou redirecionado para a tela de login

  @dados_do_usuario
    Cenário: Validar dados do usuario
      Quando realizo login com o usuário 'valido'
      E entro no perfil
      Então vejo todas as minhas informações