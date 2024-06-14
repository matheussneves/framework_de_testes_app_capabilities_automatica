#language: pt
@regression
@detalhes_do_anuncios_Laudo_Vistoria_Visao360

Funcionalidade: Detalhes do anúncio Carro Laudo Vistoriado e Visao 360
  Eu como QA da Webmotors
  Quero garantir a qualidade dos cenários referente ao Detalhes do anúncio

  Contexto: Estar na home
    * estou na "Home" no status "Deslogado" com perfil 'valido'
    * clico no icone "Buscar"
    * sou redirecionado para a tela de "Buscar"
    * filtro um veiculo "vistoriado360"
    * entro em um anuncio

@Detalhe_anuncio_Laudo_vistoriado
Cenario: Anuncio com Laudo Vistoriado
    Quando clico em Mais Detalhes
    E clico em visualizar laudo
    Então valido o laudo vistoriado do veiculo

@Detalhe_anuncio_Laudo_vistoriado_SaibaMais
Cenario: Anuncio com Laudo Vistoriado - Saiba Mais
    Quando clico em Mais Detalhes
    E clico Saiba Mais
    Entao devo ser direcionado para cockpit laudo vistoriado

@Detalhe_anuncio_Visao360
Cenario: Anuncio com visão 360
    Quando clico em Ver Visao360
    Então valido as fotos e video no visao360