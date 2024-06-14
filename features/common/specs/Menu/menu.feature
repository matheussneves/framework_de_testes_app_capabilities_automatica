# encoding: utf-8
# language:pt

@regression
@menu_deslogada
@deslogado

Funcionalidade: Home deslogada
  Eu como QA da Webmotors
  Quero garantir a qualidade dos cenários referente a home do APP
 
    Contexto: Estar no menu
     * estar na home do APP
     * clico no icone 'Menu'

@validar_acesso_login
Cenário: Validar acesso as configurações
    Quando clico em entrar
    Então sou redirecionado para a tela de login
