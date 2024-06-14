Quando('cadastro as informações do profile {string}') do |profile|
  quero_vender.preencher_dados_veiculo(profile)
end

Quando('relizo o pagamento conforme o profile {string}') do |profile|
  quero_vender.pagar(profile)
end

Quando('adiciono as fotos') do
  quero_vender.criaranuncio.esperar(20).clicar
end

Quando('marco para exibir o telefone no anuncio e clico em continuar') do
  quero_vender.checkBoxTelefone.clicar(90)
  quero_vender.btnContinuePhone.clicar(90)
end

Entao('anuncio sera finalizado com sucesso') do
  expect(quero_vender.btnPagamentoSucesso.esperar(300)).to be_truthy
end
