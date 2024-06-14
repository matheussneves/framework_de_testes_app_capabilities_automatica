# encoding: utf-8
# language:pt

@regression
@tabbar
@deslogado

Funcionalidade: Tabbar deslogada
  Eu como QA da Webmotors
  Quero garantir a qualidade dos cenários referente a home do APP
 
    Contexto: Estar na home
     * estar na home do APP

Cenário: Validar Tabbar
    Quando estou na <pagina> no status <status> com perfil 'valido'
    E clico no icone <icone>
    Então sou redirecionado para a tela de <tela>
    
    Exemplos:
      
      | pagina   | status        | icone       | tela          |
      | 'Busca'  | 'Deslogado'   | 'Início'    | 'Inicio'      |
      | 'Home'   | 'Deslogado'   | 'Buscar'    | 'Buscar'      |
      | 'Home'   | 'Deslogado'   | 'Favoritos' | 'Login'       |
      | 'Home'   | 'Deslogado'   | 'Menu'      | 'Menu'        |
      | 'Home'   | 'Deslogado'   | 'Serviços'  | 'Login'       |
      | 'Home'   | 'Logado'      | 'Buscar'    | 'Buscar'      |
      | 'Home'   | 'Logado'      | 'Favoritos' | 'Favoritos'   |
      | 'Home'   | 'Logado'      | 'Menu'      | 'Menu logado' |
      | 'Home'   | 'Logado'      | 'Serviços'  | 'Serviços'    |