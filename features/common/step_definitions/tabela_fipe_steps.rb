Quando('clico na aba {string} da Tabela Fipe') do |tab|
  tabela_fipe.tab(tab.downcase).clicar
end

Quando('preencho os campos de filtro com o {string}') do |profile|
  @veic = carregar_massa("filtro", profile.downcase)
  tabela_fipe.cmpmarca.esperar.visivel?
  tabela_fipe.cmpmarca.clicar
  tabela_fipe.prencher_busca(@veic.filtros.marca.valor)
  tabela_fipe.prencher_busca(@veic.filtros.modelo.valor)
  tabela_fipe.prencher_busca(@veic.filtros.ano.valor)
  tabela_fipe.prencher_busca(@veic.filtros.versao.valor) unless @veic.filtros.versao.valor.eql?('')
  tabela_fipe.prencher_busca(@veic.filtros.estado.valor)
  tabela_fipe.cmpblindado.clicar if @veic.filtros.blindagem.valor
end
    
Quando('clicar no elemento {string}') do |componente|
  case componente
    when 'AVALIAR' then tabela_fipe.cmpavaliar.clicar
    when 'limpar marca' then tabela_fipe.cmplimparcampo.clicar
    when 'Limpar' 
      tabela_fipe.cmplimpar.clicar
      'LIMPAR'.type_text.clicar
    end
end

Então('a tela {string} é exibida corretamente') do |tela|
   expect(tabela_fipe.lbltitulo_ra.esperar.texto).to eql(tela)
end

Então('vejo as informaçoes de preço sendo exibidas corretamente') do
  @fipe = tdm('dados_fipe', marca: @veic.filtros.marca.valor, modelo: @veic.filtros.modelo.valor, ano: @veic.filtros.ano.valor.to_i, versao: @veic.filtros.versao.valor, estado: @veic.filtros.estado.valor, veiculo: @veic.veiculo)
  aggregate_failures do
    expect(tabela_fipe.lblatualizacaowm.esperar.texto).to eql("Última atualização: #{Date.parse(@fipe.BrazilianPrice.UpdateDate).strftime('%d/%m/%Y')}")
    expect(tabela_fipe.minbr.esperar.texto.to_s.sub('R$', '').sub(',00', '').sub('.', '')[1,100].to_i).to eql(@fipe.BrazilianPrice.Smaller.eql?(nil) ? 0 : @fipe.BrazilianPrice.Smaller)
    expect(tabela_fipe.medbr.esperar.texto.to_s.sub('R$', '').sub(',00', '').sub('.', '')[1,100].to_i).to eql(@fipe.BrazilianPrice.Medium.eql?(nil) ? 0 : @fipe.BrazilianPrice.Medium)
    expect(tabela_fipe.maxbr.esperar.texto.to_s.sub('R$', '').sub(',00', '').sub('.', '')[1,100].to_i).to eql(@fipe.BrazilianPrice.Higher.eql?(nil) ? 0 : @fipe.BrazilianPrice.Higher)
    expect(tabela_fipe.minstate.esperar.texto.to_s.sub('R$', '').sub(',00', '').sub('.', '')[1,100].to_i).to eql(@fipe.SelectedStatePrice.Smaller.eql?(nil) ? 0 : @fipe.SelectedStatePrice.Smaller)
    expect(tabela_fipe.medstate.esperar.texto.to_s.sub('R$', '').sub(',00', '').sub('.', '')[1,100].to_i).to eql(@fipe.SelectedStatePrice.Medium.eql?(nil) ? 0 : @fipe.SelectedStatePrice.Medium)
    expect(tabela_fipe.maxstate.esperar.texto.to_s.sub('R$', '').sub(',00', '').sub('.', '')[1,100].to_i).to eql(@fipe.SelectedStatePrice.Higher.eql?(nil) ? 0 : @fipe.SelectedStatePrice.Higher)
    expect(tabela_fipe.lblatualizacaofipe.esperar.texto).to eql("Última atualização: #{Date.parse(@fipe.FipeUpdateDate).strftime('%d/%m/%Y')}" )
    expect(tabela_fipe.lblvalorfipe.esperar.texto.to_s.sub('R$', '').sub(',00', '').sub('.', '')[1,100].to_i).to eql(@fipe.FipePrice.eql?(nil) ? 0 : @fipe.FipePrice)
  end
end

Então('vejo os botões {string} e {string}') do |btn1, btn2|
  aggregate_failures do
    expect(tabela_fipe.btnvendermeucarro.esperar.texto).to include(btn1)
    expect(tabela_fipe.btnverofertas.esperar.texto).to include(btn2)
  end
end

Quando('clico no botão {string} no RA') do |btn|
  btn.include?('Vender') ? tabela_fipe.btnvendermeucarro.clicar : tabela_fipe.btnverofertas.clicar
end

Então('sou redirecionado para o fluxo de Anunciar meu veículo') do
  step("sou redirecionado para a tela 'tela de criação de anuncio'")
end

Então('sou redirecionado para a tela de busca com o veiculo selecionado na tabela fipe') do
  aggregate_failures do
    expect(@veic.filtros.marca.valor.type_text.esperar.visivel?).to be_truthy
    expect(@veic.filtros.modelo.valor.type_text.esperar.visivel?).to be_truthy
    expect(@veic.filtros.versao.valor.type_text.esperar.visivel?).to be_truthy
  end
end

Então('campo marca é limpo') do
  expect(tabela_fipe.cmpmarca.esperar.texto).to eql("Marca")
end

Então('todos os campos são limpos') do
  aggregate_failures do
    expect(tabela_fipe.cmpmarca.esperar.texto).to eql("Marca")
    expect(tabela_fipe.cmpmodelo.esperar.texto).to eql("Modelo")
    expect(tabela_fipe.cmpanomodelo.esperar.texto).to eql("Ano Modelo")
    expect(tabela_fipe.cmpversao.esperar.texto).to eql("Versão") unless @versao.eql?(nil)
    expect(tabela_fipe.cmpestado.esperar.texto).to eql("Estado")
  end
end