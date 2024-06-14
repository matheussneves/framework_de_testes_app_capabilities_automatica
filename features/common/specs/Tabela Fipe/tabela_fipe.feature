# encoding: utf-8
# language:pt
@ignorarios
@regression
@tabela_fipe

Funcionalidade: Tabela Fipe
  Eu como QA da Webmotors
  Quero garantir a qualidade dos cenários referente a Tabela Fipe

  Contexto: Estar na home
    * estou na "Home" no status "Logado" com perfil 'valido'
    * clico no botão "Tabela Fipe" do carrossel
    * sou redirecionado para a tela "tela tabela webmotors"

  @validar_pesquisa_tabela_fipe
  Cenário: Validar pesquisa tabela Fipe
    Quando clico na aba <veiculo> da Tabela Fipe
    E preencho os campos de filtro com o <profile>
    E clicar no elemento "AVALIAR"
    Então a tela "Resultado da Avaliação" é exibida corretamente
    E vejo as informaçoes de preço sendo exibidas corretamente
    E vejo os botões "Vender" e "Ver ofertas"

    Exemplos:
      | veiculo   | profile    |
      | 'Carro'   | 'astra'    |
      | 'Moto'    | 'f_800_r'  |

    @validar_botao_vender_meu_veiculo
    Cenário: Validar botão Vender meu carro
    Quando clico na aba <veiculo> da Tabela Fipe
    E preencho os campos de filtro com o <profile>
    E clicar no elemento "AVALIAR"
    E clico no botão <vender> no RA
    Então sou redirecionado para o fluxo de Anunciar meu veículo

     Exemplos:
      | veiculo   | profile    | vender              |
      | 'Carro'   | 'astra'    | "Vender meu carro"  |
      | 'Moto'    | 'f_800_r'  | "Vender minha moto" |
    
    @validar_botao_ver_ofertas
    Cenário: Validar botão Ver ofertas
    Quando clico na aba <veiculo> da Tabela Fipe
    E preencho os campos de filtro com o <profile>
    E clicar no elemento "AVALIAR"
    E clico no botão "Ver ofertas" no RA
    Então sou redirecionado para a tela de busca com o veiculo selecionado na tabela fipe 

 Exemplos:
      | veiculo   | profile    |
      | 'Carro'   | 'astra'    |
      | 'Moto'    | 'f_800_r'  |

  @validar_funcao_limpar_campo
  Cenário: Validar função limpar campo
    Quando clico na aba <veiculo> da Tabela Fipe
    E preencho os campos de filtro com o <profile>
    E clicar no elemento "limpar marca"
    Então campo marca é limpo

    Exemplos:
      | veiculo   | profile    |
      | 'Carro'   | 'astra'    |
      | 'Moto'    | 'f_800_r'  |

  @validar_pesquisa_tabela_fipe_botao_limpar
  Cenário: Validar botão limpar
    Quando clico na aba <veiculo> da Tabela Fipe
    E preencho os campos de filtro com o <profile>
    E clicar no elemento "Limpar"
    Então todos os campos são limpos

    Exemplos:
      | veiculo   | profile    |
      | 'Carro'   | 'astra'    |
      | 'Moto'    | 'f_800_r'  |