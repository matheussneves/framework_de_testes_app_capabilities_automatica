Quando('entro no perfil') do
  step('estar na home do APP')
  home.iconePerfil.esperar(15).clicar
end

Então('vejo todas as minhas informações') do
  @dados_usuario = tdm('dados_usuario', email: @usuario.email, senha: @usuario.senha )
  aggregate_failures do
    expect('Minha Conta'.type_text.esperar.visivel?).to be_truthy
    expect(perfil.txtname.esperar.texto).to eql(@dados_usuario.Nome)
    expect(perfil.txtemail.esperar.texto).to eql(@dados_usuario.Email)
    expect(perfil.txtphone.esperar.texto).to eql("(#{@dados_usuario.DDDPrincipal}) #{@dados_usuario.TelefonePrincipal.insert((@dados_usuario.TelefonePrincipal[0].eql?('9') ? -5 : -6), '-')}")
    expect(perfil.txtcbphone.esperar.buscar.checked).to eql(@dados_usuario.ShowPhone.eql?('1').to_s)
    expect(perfil.txtcpf.esperar.texto).to eql(@dados_usuario.CPF)
    expect(perfil.txtgenero.esperar.texto).to eql(@dados_usuario.Sexo.eql?('M') ? "Masculino" : "Feminino")
    expect(perfil.txtdtnasc.esperar.texto).to eql(Date.parse(@dados_usuario.DataNascimento).strftime('%d/%m/%Y'))
    expect(perfil.txtcep.esperar.texto).to eql(@dados_usuario.CEP)
    expect(perfil.txtestado.esperar.texto).to eql(@dados_usuario.Uf)
    expect(perfil.txtcidade.esperar.texto).to eql(@dados_usuario.Cidade)
    expect(perfil.txtmaior18.esperar.texto).to eql("Declaro ter ciência de que este cadastro é somente para maiores de 18 anos.")
  end
end

