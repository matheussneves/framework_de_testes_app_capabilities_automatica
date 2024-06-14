# encoding: utf-8
# language:pt

@regression
@home_deslogada
@deslogado

Funcionalidade: Home deslogada
  home do APP
 
    Contexto: Estar na home
     * estar na home do APP

@validar_acesso_configurações
Cenário: Validar acesso as configurações
    Quando clico no icone de configuração
    Então sou redirecionado para a tela de configuração