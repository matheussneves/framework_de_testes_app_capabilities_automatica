#language: pt

@regression
@financiamento
@deslogado

Funcionalidade: Quero Financiar

Contexto: Estar na home
     * estar na home do APP

  @quero_financiar 
  Cenário: Quero Financiar
    Quando clico no botão <botao> do carrossel
    Então sou redirecionado para a tela <tela>

    Exemplos:
      | botao                       | tela                                  |
      | 'Quero financiar'           | 'site webmotors financia'             |