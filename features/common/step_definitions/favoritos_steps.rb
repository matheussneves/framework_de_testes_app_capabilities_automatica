Dado('que clico em favoritos na home sem estar logado') do
    home.clicar_favoritos_carrosel
end

Dado('que clico em favorito no sub menu sem estar logado') do
    home.clicar_favoritos_nav_bar
end

Dado('que clico em favorito no nave bar sem estar logado') do
    home.clicar_favoritos_nav_bar
end

Quando('que clico favorito no nave bar') do
    home.clicar_favoritos_nav_bar
end

Quando('clico Ordenar') do
    favoritos.btnOrdenar.clicar(90)
end
  
Então('valido ordenação salvo recentemente') do
    favoritos.salvosRecentes.clicar(90)
    expect(favoritos.mengOrdenarRecentemente.esperar(90).visivel?).to be_truthy
end

Então('valido menor preço') do
    favoritos.menorPreco.clicar(90)
    expect(favoritos.mengOrdenarMenorPreco.esperar(90).visivel?).to be_truthy
end

Então('valido ordenação maior preço') do
    favoritos.maiorPreco.clicar(90)
    expect(favoritos.mengOrdenarMaiorPreco.esperar(90).visivel?).to be_truthy
end

Então('valido ordenação ordem alfabetica') do
    favoritos.ordemAlfabetica.clicar(90)
    expect(favoritos.mengOrdenarAlfabetica.esperar(90).visivel?).to be_truthy
end

Quando('clico em buscar') do
    steps %(
        E clico no icone 'Buscar'
        Então sou redirecionado para a tela de 'Buscar'
    )
end
  
Quando('clico em Ver anuncios') do
    favoritos.btnVerAnuncioFavorito.clicar(90)
    tap_by_coord(331, 198)
end
  
Então('favorito anuncio pela tela de pesquisa') do
    steps %(
    entro em um anuncio
    clico no botão 'Favoritar'
    vejo o pop up 'Anúncio salvo em "Favoritos"'
    )
end

Quando('clico no anuncio') do
    tap_by_coord(186, 416)
    tap_by_coord(186, 416)
end
  
Então('favorito anuncio pela tela de detalhes do anuncio') do
    favoritos.favoritarDA.clicar(90)
end

Quando('seleciono aba motos') do
    quero_comprar.btnMoto
end