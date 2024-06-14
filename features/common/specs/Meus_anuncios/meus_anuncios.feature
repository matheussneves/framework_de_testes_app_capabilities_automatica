#language: pt

@regression
@meus_anuncios

Funcionalidade: Meus Anuncios

Contexto: Estar na home
     * estar na home do APP
     * estou na "Home" no status "Logado" com perfil 'chat'
     * clico no botão 'Meus anúncios' do carrossel
     * sou redirecionado para a tela 'Meus anúncios'

@anuncio_ativo 
  Cenario: Anuncios Ativos
    Quando verifico os anuncios ativos 
    Entao valido todos anuncios ativos

@anuncio_dados_incompletos
  Cenario: Anuncios Dados Incopletos
    Quando verifico os anuncios dados incompletos 
    Entao valido todos anuncios dados incompletos

@anuncio_aguardando_pagamento
  Cenario: Anuncios Aguardando Pagamento
    Quando verifico os anuncios que esteja aguardando pagamento 
    Entao valido todos anuncios aguardando pagamento

@anuncio_desativado
  Cenario: Anuncios Desativado
    Quando verifico os anuncios que esteja desativado
    Entao valido todos anuncios desativado
 
@anuncio_em_analise
  Cenario: Anuncios em analise
    Quando verifico os anuncios que esteja em analise 
    Entao valido todos anuncios em analise