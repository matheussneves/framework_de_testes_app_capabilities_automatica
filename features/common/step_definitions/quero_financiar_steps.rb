Dado('que acesso a home do app') do
    home.validar_banner_home
end
  
Quando('clico na opcao quero financiar') do
    home.btnQueroFinanciar.clicar(20)
end

Então('sou redirecionado para a pagina web de financiamento') do
    expect(quero_financiar.tituloTela.esperar.visivel?).to be_truthy
end