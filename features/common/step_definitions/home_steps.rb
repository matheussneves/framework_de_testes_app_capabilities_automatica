Dado('estar na home do APP') do
  home.iconechat.esperar(30)
end

Quando('clico no icone de configuração') do
  home.iconechat.clicar
end

Então('sou redirecionado para a tela de configuração') do
  expect(menu.lbl_titulo.esperar.visivel?).to be_truthy
end
