Dado('que clico em meus anuncios na home sem estar logado') do
    home.clicar_meus_anuncios_sub_menu
end

Dado('que clico em meus anuncios no sub menu sem estar logado') do
    home.clicar_meus_anuncios_sub_menu
end

Quando('que clico em meus anuncios na home') do
    home.clicar_meus_anuncios_sub_menu
end

Quando('verifico se o anuncio esta desabilitado') do
    meus_anuncios.validar_status_anuncio_desabilitado
end

Quando('habilito o anuncio') do
    meus_anuncios.btnAlterarStatus.clicar(10)
end

Entao('valido que ele esta habilitado') do
    expect(meus_anuncios.statusHabilitadoDesabilitado.esperar(10).texto).to eql "Ativo"
end

Quando('verifico se o anuncio esta habilitado') do
    meus_anuncios.validar_status_anuncio_habilitado
end

Quando('desabilito o anuncio') do
    meus_anuncios.btnAlterarStatus.clicar(10)
    meus_anuncios.opcaoParaDesabilitar.clicar(10)
    meus_anuncios.confirmarAnuncioDesabilitado.clicar(10)
end

Entao('valido que ele esta desabilitado') do
    expect(meus_anuncios.validar_status_anuncio_desabilitado).to be_truthy
end

Quando('excluo anuncio') do
    meus_anuncios.btnAlterarStatus.clicar(10)
    meus_anuncios.btnAlterarStatus.clicar(10)
    #meus_anuncios.opcaoParaDesabilitar.clicar(10)
   # meus_anuncios.confirmarAnuncioDesabilitado.clicar(10)
    meus_anuncios.clicar_excluir
    meus_anuncios.btnExcluirAnuncio.clicar(50)
end
  
Entao('valido que ele foi excluido.') do
    expect(meus_anuncios.validar_status_anuncio_desabilitado).to be_truthy
    #expect(meus_anuncios.btnExcluir.esperar(50).visivel?).to be true
end

Quando('verifico os anuncios ativos') do
   meus_anuncios.btnFiltrar.esperar(10).clicar(10)
   meus_anuncios.filtrarAnuncioAtivo.clicar(10)
end
  
Entao('valido todos anuncios ativos') do
    expect(meus_anuncios.lblstatus.esperar(10).texto).to eql('Anúncio ativo')
end

Quando('verifico os anuncios dados incompletos') do
    meus_anuncios.btnFiltrar.clicar(10)
    meus_anuncios.filtrarDadosIncompletos.clicar(10)
end
  
Entao('valido todos anuncios dados incompletos') do
    expect(meus_anuncios.lblstatus.esperar(10).texto).to eql('Dados incompletos')
end

Quando('verifico os anuncios que esteja aguardando pagamento') do
    meus_anuncios.btnFiltrar.clicar(10)
    meus_anuncios.filtrarAguardandoPagamento.clicar(10)
end
  
Entao('valido todos anuncios aguardando pagamento') do
    expect(meus_anuncios.lblstatus.esperar(10).texto).to eql('Aguardando pagamento')
end

Quando('verifico os anuncios que esteja desativado') do
    meus_anuncios.btnFiltrar.esperar(10).clicar(10)
    meus_anuncios.filtrarAnuncioDesativado.clicar(10)
end
  
Entao('valido todos anuncios desativado') do
    expect(meus_anuncios.lblstatus.esperar(10).texto).to eql('Anúncio desativado')
end

Quando('verifico os anuncios que esteja em analise') do
    meus_anuncios.btnFiltrar.esperar(10).clicar(10)
    meus_anuncios.filtrarAnuncioAnalise.clicar(10)
end
  
Entao('valido todos anuncios em analise') do
    expect(meus_anuncios.lblstatus.esperar(10).texto).to eql('Anúncio em análise')
end