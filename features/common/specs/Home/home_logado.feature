# encoding: utf-8
# language:pt

@regression
@home_logada

Funcionalidade: Home logada
  Eu como QA da Webmotors
  Quero garantir a qualidade dos cenários referente a home do APP
 
    Contexto: Estar na home logado
     * estou na "Home" no status "Logado" com perfil 'valido'

@validar_acesso_ao_perfil
Cenário: Validar acesso ao perfil
    Quando clico no icone de perfil
    Então sou redirecionado para a tela de perfil do usuario

@validar_banners_da_home_logada  @ignorarios
Cenário: Validar Banners da home logada
    Quando clico no banner <banner>
    Então sou redirecionado para <destino>

    Exemplos:
      | banner                                                | destino                             |
      | "Agende serviços para\no seu carro perto de você!"    | "tela de serviços"                  |
      | "Veja todos os ângulos\ndo seu veículo favorito"      | "tela de busca com filtro visão360" |

@valida_carrossel_logado @ignorarios
Cenário: Validar carrossel: O que você quer fazer?
    Quando clico no botão <botao> do carrossel
    Então sou redirecionado para a tela <tela>

    Exemplos:
      | botao                      | tela                                  |
      | 'Quero financiar'          | 'site webmotors financia'             |
      | 'Quero vender'             | 'tela de criação de anuncio'          |
      | 'Meus anúncios'            | 'Meus anúncios'                       |
      | 'Serviços'                 | 'tela de Serviços'                    |
      | 'Favoritos'                | 'tela de Favoritos'                   |

@validar_menu_logado
Cenário: Validar menu
    Quando clico no botão do menu <botao>
    Então sou redirecionado para a <tela>
    
    Exemplos:
      | botao                     | tela                         |
      | "Meus anúncios"           | 'Meus Anúncios'              |
      | 'Favoritos'               | 'Favoritos'                  |

@validar_componente_ver_servicos_logado
Cenário: Validar componente Ver Serviços
    Quando clico botão Ver Serviços
    Então sou redirecionado para a tela de Serviços

@validar_componente_meu_credito_pre_aprovado_logado
Cenário: Validar componente Meu crédito pré-aprovado
    Quando vejo o componente Meu crédito pré-aprovado
    E preencho o campo CPF com CPF <tipo> com o checkbox Aceito os termos "Preenchido"
    Então o APP <acao>

    Exemplos:
      | tipo                 | acao                                                                                       |
      #| 'Com valor aprovado' | 'Redireciona para a tela de busca com filtro de valor preenchido com o valor pré aprovado' |
      # ver  | 'Sem valor aprovado' | 'Redireciona para a tela de login'                                                         |
