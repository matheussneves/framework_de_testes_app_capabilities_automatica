# encoding: utf-8
# language:pt

@regression
@home_deslogada
@deslogado

Funcionalidade: Home deslogada
  Eu como QA da Webmotors
  Quero garantir a qualidade dos cenários referente a home do APP
 
    Contexto: Estar na home
     * estar na home do APP

@validar_acesso_configurações
Cenário: Validar acesso as configurações
    Quando clico no icone de configuração
    Então sou redirecionado para a tela de configuração

@validar_banners_home @ignorarios
Cenário: Validar Banners da home
    Quando clico no banner <banner>
    Então sou redirecionado para <destino>

    Exemplos:
      | banner                                                | destino                             |
      | "Agende serviços para\no seu carro perto de você!"    | "tela de login"                     |
      | "Acesse para saber tudo de carro e moto!"             | "site WM1"                          |
      | "Veja todos os ângulos\ndo seu veículo favorito"      | "tela de busca com filtro visão360" |
      | "Aqui você garante o seu\nSUV 0km em poucos cliques!" | "site webmotors catalogo"           |
      | "Novo Fiat Uno Do Ano"                                | "site Notícia WM1"                  |

@validar_carrossel_home @ignorarios
Cenário: Validar carrossel: O que você quer fazer?
    Quando clico no botão <botao> do carrossel
    Então sou redirecionado para a tela <tela>

    Exemplos:
      | botao                       | tela                                  |
      | 'Meu crédito pré-aprovado'  | "componente Meu crédito pré-aprovado" |
      | 'Quero comprar'             | "tela de busca"                       |
      | 'Quero vender'              | "tela de login"                       |
      | 'Quero financiar'           | "site webmotors financia"             |
      | 'Notícias WM1'               | "site Notícia WM1"                    |
      | 'Meus anúncios'             | "tela de login"                       |
      | 'Serviços'                 | "tela de login"                       |
      | 'Tabela Fipe'               | "tela tabela webmotors"               |
      | 'Favoritos'               | "tela de login"                       |
      | 'Quero sonhar'              | "tela de busca"                       |


@validar_componente_meu_credito_pre_aprovado  @ignorarios
Cenário: Validar componente Meu crédito pré-aprovado
    Quando vejo o componente Meu crédito pré-aprovado
    E preencho o campo CPF com CPF <tipo> com o checkbox Aceito os termos <preenchimento>
    Então o APP <acao>

    Exemplos:
      | tipo                 | preenchimento    | acao                                                                                       |
      | "Com valor aprovado" | "Não preenchido" | "Não habilita o botão descobrir crédito pré-aprovado"                                      |
       #| "Com valor aprovado" | "Preenchido"     | "Redireciona para a tela de busca com filtro de valor preenchido com o valor pré aprovado" |
      | "Sem valor aprovado" | "Preenchido"     | "Redireciona para a tela de login"                                                         |
      | "Invalido"           | "Preenchido"     | "Exibe mensagem CPF inválido"                                                              |
      | "Vazio"              | "Preenchido"     | "Exibe mensagem CPF inválido"                                                              |
      
@validar_banner_noticia_wm1 @ignorarios
Cenário: Validar banners Notícia WM1
    Quando clico no banner com a notícia <noticia>
    Então sou redirecionando para a pagina da notícia

    Exemplos:
      | noticia                                             |
      # | "Novo Fiat Uno Do Ano" |
      # | "Novo Fiat" |
      # | "Uno Do Ano" |
      
@validar_componente_buscar_veiculo
Cenário: Validar componente Buscar veículo
    Quando clico no botão Buscar veículo
    Então sou redirecionado para a tela de busca

@validar_menu
Cenário: Validar menu
    Quando clico no botão do menu <botao>
    Então sou redirecionado para a <tela>
    
    Exemplos:
      | botao                     | tela                         |
      | "Meus anúncios"           | "Login"                      |
      | "Tabela Fipe e Webmotors" | "Tabela Webmotors"           |
      | "Catálogo 0km"            | "Catálogo 0km"               |
      | "Notícias WM1"            | "Pagina de Notícias"         |# não tem no ios
      | "Favoritos"               | "Login"                      |
      | "Últimas buscas"          | "Últimas buscas"             |
      
@validar_componente_ver_servicos
Cenário: Validar componente Ver Serviços
    Quando clico botão Ver Serviços
    Então sou redirecionado para a tela de login