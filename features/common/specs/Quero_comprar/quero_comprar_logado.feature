#language: pt
@regression
@quero_comprar_logado

Funcionalidade: Quero Comprar Logado

Contexto: Estar na home logado
    * estou na "Home" no status "Logado" com perfil 'chat'
    * clico no icone "Buscar"
    * sou redirecionado para a tela de "Buscar"

@lead_msg_carro_logado
  Cenario: Logado - Enviar um lead de carro
    Quando clico no botao ver anuncio
    E entro em um anuncio
    E clico em enviar mensagem
    E marcar o chebox para receber contatos automatica
    E clico para enviar a mensagem
    Entao valido que a mensagem foi enviada com sucesso

@lead_msg_moto_logado
  Cenario: Logado - Enviar um lead de moto
    Quando clico na opcao moto
    E clico no botao ver anuncio
    E entro em um anuncio
    E clico em enviar mensagem
    E marcar o chebox para receber contatos automatica
    Quando clico para enviar a mensagem 
    Entao valido que a mensagem foi enviada com sucesso
