module Chat
    class Chat
      attr_accessor :lbl_chat, :btnConversaChat, :bntOpcaoMensagem, :btnEnviarMensagem, :btnDetalheAnuncio, :btnMore, :btnTelefone, :clicarVerAnuncio, 
      :escolherContato, :abaVendedor, :cmpEscreverMsg, :iconeTelaChat, :informacaoPopup, :itemMensagemEnviada, :itemMensagemEnviadaDitadaComprando,
      :itemMensagemEnviada2, :itemMensagemEnviada2DitadaVendendo, :btnConversaChatvendendo
  
        def initialize
          initialize_chat
        end
  
        def initialize_chat
         @lbl_chat = android? ? 'hands.android.webmotors.debug:id/chat'.type_id : 'Chat'.type_id
         @btnConversaChatvendendo = android? ? 'clRoot'.type_id : '//XCUIElementTypeScrollView/XCUIElementTypeOther[2]/XCUIElementTypeTable/XCUIElementTypeCell[8]/XCUIElementTypeOther[1]/XCUIElementTypeOther'.type_xpath
         @btnConversaChat = android? ? 'clRoot'.type_id  : 'chat'.type_id
         @bntOpcaoMensagem = android? ? 'tvDoneResponse'.type_id : '//XCUIElementTypeCollectionView/XCUIElementTypeCell[1]/XCUIElementTypeOther/XCUIElementTypeOther'.type_xpath
         @btnEnviarMensagem = android? ? 'btSend'.type_id : 'sendIcon'.type_accessibility_id
         @btnDetalheAnuncio = android? ? 'tvAdDetails'.type_id : 'XCUIElementTypeImage'.type_class
         @btnMore = android? ? 'btMore'.type_id : 'moreIcon'.type_accessibility_id
         @btnTelefone = android? ? 'btCall'.type_id : 'phoneEnableIcon'.type_id
         @clicarVerAnuncio = android? ? 'btSeeAd'.type_id : 'Ver anúncio'.type_id
         @escolherContato = android? ? 'tvChoosePhone'.type_id : 'Cancelar'.type_accessibility_id
         @abaVendedor = android? ? 'Vendendo'.type_text : 'Vendendo'.type_accessibility_id
       # ------> Input text
         @cmpEscreverMsg = android? ? 'etSendMessage'.type_id : 'campo_Digite uma mensagem'.type_accessibility_id
       # ------> Icone
         @iconeTelaChat = android? ? 'Chat'.type_id : 'Chat'.type_id
       # ------> Mensagens enviadas
         @informacaoPopup = android? ? 'Não compartilhe senhas e códigos de acesso com terceiros. Utilize esses dados APENAS para acessar sua conta no site ou aplicativo da Webmotors.'.type_text : ''.type_text
         @itemMensagemEnviada = android? ? 'Ainda está disponível?'.type_text : ' Ainda está disponível?'.type_id
         @itemMensagemEnviadaDitadaComprando = android? ? 'Teste'.type_text : 'Teste'.type_id
         @itemMensagemEnviada2 = android? ? 'Desculpe, já vendi!'.type_text : 'Desculpe, já vendi!'.type_id
         @itemMensagemEnviada2DitadaVendendo = android? ? 'Teste'.type_text : 'Teste'.type_id
         end

        def enviar_mensagem_digitada(texto)
          @cmpEscreverMsg.esperar.digitar(texto)
          @btnEnviarMensagem.clicar(90)
        end
    end
end
  