#language: pt

@regression
@favorito

Funcionalidade: Favorito
  Eu como QA da Webmotors
  Quero garantir a qualidade dos cenários referente ao Favoritos

  Contexto: Estar na home
     * estou na "Home" no status "Logado" com perfil 'chat'

@adicionar_favorito_tela_pesquisa_carro
  Cenário: Adicionar favorito tela de pesquisa
    Quando clico em buscar
    E clico no botao ver anuncio
    Então favorito anuncio pela tela de pesquisa

@adicionar_favorito_tela_pesquisa_moto
  Cenário: Adicionar moto favorito tela de pesquisa
    Quando clico em buscar
    E seleciono aba motos
    E clico no botao ver anuncio
    Então favorito anuncio pela tela de pesquisa

@ordenar_salvo_recentemente
  Cenário: Ordenacao dos favorito salvo recentemente
    Quando clico no icone 'Favoritos'
    E sou redirecionado para a tela de 'Favoritos'
    E clico Ordenar
    Então valido ordenação salvo recentemente

@ordenar_salvo_menor_preco
  Cenário: Ordenacao dos favorito menor preço
    Quando clico no icone 'Favoritos'
    E sou redirecionado para a tela de 'Favoritos'
    E clico Ordenar
    Então valido menor preço

@ordenar_maior_preco
  Cenário: Ordenacao dos favorito maior preço
    Quando clico no icone 'Favoritos'
    E sou redirecionado para a tela de 'Favoritos'
    E clico Ordenar
    Então valido ordenação maior preço

@ordenar_ordem_alfabetica
  Cenário: Ordenacao dos favorito ordem alfabetica
    Quando clico no icone 'Favoritos'
    E sou redirecionado para a tela de 'Favoritos'
    E clico Ordenar
    Então valido ordenação ordem alfabetica