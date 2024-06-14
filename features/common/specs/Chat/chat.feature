#language: pt

@regression
@chat

Funcionalidade: Chat
  Eu como QA da Webmotors
  Quero garantir a qualidade dos cenários referente ao chat

  Contexto: Estar na home
     * estou na "Home" no status "Logado" com perfil 'chat'
     * clico no botão Chat
     * sou redirecionado para a tela de "Chat"

  @comprando_envio_mensagem_pronta
  Cenário: Envio de mensagem pronta no chat
    Quando que clico na conversa
    E envio uma mensagem pronta ao vendedor "Ainda está disponível?"
    Então visualizo a mensagem enviada na conversa - comprando "Ainda está disponível?"

  @comprando_envio_mensagem_digitada
  Cenário: Envio de mensagem pronta no chat
    Quando que clico na conversa
    E envio uma mensagem digitada ao vendedor "Teste"
    Então visualizo a mensagem digitada enviada na conversa - comprando "Teste"

 @comprando_direcionamento_detalhe_anuncio
  Cenário: Direcionamento ao detalhe do anúncio
    Quando que clico na conversa
    E que clico no anuncio dentro da conversa
    Então sou direcionado ao Detalhes do anúncio

  @comprando_direcionamento_ver_anuncio
  Cenário: Direcionamento ao detalhe do anúncio pelo meno de tres pontos
    Quando que clico na conversa
    E clico no menu ao lado do telefone
    E clico em ver anuncio chat
    Então sou direcionado ao Detalhes do anúncio

  @vendendo_envio_mensagem_pronta
  Cenário: Envio de mensagem pronta no chat - vendedor
    Quando clico na aba de vendedor
    E que clico na conversa - vendendo
    E envio uma mensagem pronta ao comprador
    Entao visualizo a mensagem enviada na conversa - vendendo "Desculpe, já vendi!"

  @vendendo_envio_mensagem_digitada
  Cenário: Envio de mensagem pronta no chat
    Quando clico na aba de vendedor
    E que clico na conversa - vendendo
    E envio uma mensagem digitada ao comprador "Teste"
    Então visualizo a mensagem digitada enviada na conversa - vendendo "Teste"

  @vendendo_direcionamento_ver_anuncio
  Cenário: Direcionamento ao detalhe do anúncio pelo meno de tres pontos
    Quando clico na aba de vendedor
    Entao que clico na conversa - vendendo

  @vendendo_direcionamento_detalhe_anuncio
  Cenário: Direcionamento ao detalhe do anúncio 
    Quando clico na aba de vendedor
    Então valido as conversas da aba vendendo

  @vendendo_contato
  Cenário: Vizualizar os numeros para contato
    Quando clico na aba de vendedor
    Entao que clico na conversa - vendendo