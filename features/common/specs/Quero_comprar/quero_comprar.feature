#language: pt
@regression
@quero_comprar_deslogado
@deslogado

Funcionalidade: Quero Comprar

Contexto: Estar na home
    * estou na "Home" no status "Deslogado" com perfil 'valido'
    * clico no icone "Buscar"
    * sou redirecionado para a tela de "Buscar"

@lead_msg_carro_deslogado
  Cenario: Deslogado - Enviar um lead de carro
    Quando clico no botao ver anuncio
    E entro em um anuncio
    E clico em enviar mensagem
    E preencho o campo de mensagem
    E marcar o chebox para receber contatos
    E clico para enviar a mensagem
    Entao valido que a mensagem foi enviada com sucesso

@lead_msg_moto_deslogado
  Cenario: Deslogado - Enviar um lead de moto
    Quando clico na opcao moto
    E clico no botao ver anuncio
    E entro em um anuncio
    E clico em enviar mensagem
    E preencho o campo de mensagem
    E marcar o chebox para receber contatos
    Quando clico para enviar a mensagem 
    Entao valido que a mensagem foi enviada com sucesso

@qr_comprar_Ver_Parcelas @ignorarios
  Cenario: Deslogado - Quero Comprar - Ver Parcelas
    Quando clico no botao ver anuncio
    E clico em ver parcelas
    E preenchos os dados pessoais
    E clico Aceito receber as ofertas
    E clico em ver parcelas novamente
    Então vejo as parcelas para o meu CPF


@qr_comprar_Ver_Parcelas_moto @ignorarios
  Cenario: Deslogado - Quero Comprar - Ver Parcelas
    Quando clico na opcao moto
    E clico no botao ver anuncio
    E clico em ver parcelas
    E preenchos os dados pessoais
    E clico Aceito receber as ofertas
    E clico em ver parcelas novamente
    Então vejo as parcelas para o meu CPF
