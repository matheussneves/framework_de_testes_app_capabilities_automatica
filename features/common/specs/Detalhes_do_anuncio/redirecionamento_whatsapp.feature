#language: pt
@ignorarios
@regression
@detalhes_do_anuncios
@whatsapp

Funcionalidade: Detalhes do anúncio
  Eu como QA da Webmotors
  Quero garantir a qualidade dos cenários referente ao Detalhes do anúncio

  @validar_redirecionamento_whatsapp_deslogado
  Cenário: Validar se o ícone de whatsapp não é exibido no DA quando o usuário não está logado.
    Dado estou na "Home" no status "Deslogado" com perfil 'valido'
    E clico no icone "Buscar"
    E sou redirecionado para a tela de "Buscar"
    E filtro um veiculo <profile>
    Quando instalo o app <app>
    E entro em um anuncio
    E clico no botão "whatsapp"
    Então sou redirecionado para a tela de "discagem do celular"

  Exemplos:
   | app                            | profile                                    |
   | "Whatsapp"                     | "anuncio_carro_pf_com_telefone_habilitado" |
   | "Whatsapp Business"            | "anuncio_carro_pf_com_telefone_habilitado" |
   | "Whatsapp e Whatsapp Business" | "anuncio_carro_pf_com_telefone_habilitado" |
   | "Sem app"                      | "anuncio_carro_pf_com_telefone_habilitado" |
   | "Whatsapp"                     | "anuncio_moto_pf_com_telefone_habilitado"  |
   | "Whatsapp Business"            | "anuncio_moto_pf_com_telefone_habilitado"  |
   | "Whatsapp e Whatsapp Business" | "anuncio_moto_pf_com_telefone_habilitado"  |
   | "Sem app"                      | "anuncio_moto_pf_com_telefone_habilitado"  |

  @validar_redirecionamento_whatsapp_logado
  Cenário: Validar se com o usuário logado o icone de whatsapp é exibido no DA e redireciona para o aplicativo.
    Dado estou na "Home" no status "Logado" com perfil 'valido'
    E clico no icone "Buscar"
    E sou redirecionado para a tela de "Buscar"
    E filtro um veiculo <profile>
    Quando instalo o app <app>
    E entro em um anuncio
    E clico no botão "whatsapp"
    Então sou redirecionado para o app <app>

  Exemplos:
   | app                            | profile                                    |
   | "Whatsapp"                     | "anuncio_carro_pf_com_telefone_habilitado" |
   | "Whatsapp Business"            | "anuncio_carro_pf_com_telefone_habilitado" |
   | "Whatsapp e Whatsapp Business" | "anuncio_carro_pf_com_telefone_habilitado" |
   | "Sem app"                      | "anuncio_carro_pf_com_telefone_habilitado" |
   | "Whatsapp"                     | "anuncio_moto_pf_com_telefone_habilitado"  |
   | "Whatsapp Business"            | "anuncio_moto_pf_com_telefone_habilitado"  |
   | "Whatsapp e Whatsapp Business" | "anuncio_moto_pf_com_telefone_habilitado"  |
   | "Sem app"                      | "anuncio_moto_pf_com_telefone_habilitado"  |

  @validar_anuncio_com_telefone_nao_autorizado
  Cenário: Validar se quando o usuário não permite exibir o telefone o ícone de whatsapp não é exibido no DA e o ícone telefone é exibido desabilitado.
    Dado estou na "Home" no status "Logado" com perfil 'valido'
    E clico no icone "Buscar"
    E sou redirecionado para a tela de "Buscar"
    E filtro um veiculo <profile>
    Quando instalo o app <app>
    E entro em um anuncio
    Então vejo o icone de telefone desabilitado

  Exemplos:
   | app                            | profile                                      |
   | "Whatsapp"                     | "anuncio_carro_pf_com_telefone_desabilitado" |
   | "Whatsapp Business"            | "anuncio_carro_pf_com_telefone_desabilitado" |
   | "Whatsapp e Whatsapp Business" | "anuncio_carro_pf_com_telefone_desabilitado" |
   | "Sem app"                      | "anuncio_carro_pf_com_telefone_desabilitado" |
   | "Whatsapp"                     | "anuncio_moto_pf_com_telefone_desabilitado"  |
   | "Whatsapp Business"            | "anuncio_moto_pf_com_telefone_desabilitado"  |
   | "Whatsapp e Whatsapp Business" | "anuncio_moto_pf_com_telefone_desabilitado"  |
   | "Sem app"                      | "anuncio_moto_pf_com_telefone_desabilitado"  |