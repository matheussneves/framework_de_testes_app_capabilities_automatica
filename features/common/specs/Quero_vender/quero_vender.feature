#language: pt

@regression
@quero_vender 

Funcionalidade: Quero Vender

Contexto: Estar na home logado
     * estou na "Home" no status "Logado" com perfil 'valido'
     * clico no botão 'Quero vender' do carrossel
     * sou redirecionado para a tela 'tela de criação de anuncio'

  @anuncios
  Esquema do Cenario: Anunciar um veiculo
  Quando cadastro as informações do profile <veiculo>
  E adiciono as fotos
  E marco para exibir o telefone no anuncio e clico em continuar
  E relizo o pagamento conforme o profile <pagamento>
  Entao anuncio sera finalizado com sucesso

   Exemplos:
      | veiculo    | pagamento        |
      | "renegade" | "cartao_premium" |
      | "kwid"     | "boleto_premium" |
      | "renegade" | "pix_premium"    |
      | "kwid"     | "cartao_Plus"    |
      | "renegade" | "boleto_plus"    |
      | "kwid"     | "pix_plus"       |
      | "f_800_r"  | "cartao_Plus"    |
      | "f_800_r"  | "boleto_premium" |
      | "f_800_r"  | "pix_plus"       |
