module Quero_Comprar
    class Quero_Comprar
      attr_accessor :tituloTelaDA, :tituloTela, :abaVendedor, :abaFipe, :btnEntendiDA, :btnVerAnuncio, :localizacaoAnuncio, :btnEnviarMsgDA,      :btnEnviarMsgEP, :btnVerFavoritos, :btnfilter, :btnSimulate, :btnSeeConditions, :btnContinue, :btnMoto, :btnVerParcelasMotos, :cmpMensagem,
      :checkBox, :respostaMsgEnviada, :opcaoMotos, :cbNews, :propostaSucesso, :meng_atencao, :nome, :email, :tel, :cel, :dt_nasc, :fin_CPF, 
      :localizacao, :est, :btnfora, :bottomsheetfavoritos, :btn_filter, :lblname
  
        def initialize
          initialize_quero_comprar
        end
  
        def initialize_quero_comprar
          @tituloTelaDA = android? ? 'Detalhes do anúncio'.type_text : 'Detalhes do anúncio'.type_id
          @tituloTela = android? ? 'No momento não conseguimos retornar o valor das parcelas desse veículo.'.type_text : 'No momento não conseguimos retornar o valor das parcelas desse veículo.'.type_id
          @abaVendedor = android? ? 'Vendedor'.type_text : 'Vendedor'.type_id
          @abaFipe = android? ? 'Fipe'.type_text : 'Fipe'.type_id
          @btnEntendiDA = android? ? 'btOk'.type_id : 'Ok'.type_id
          @btnVerAnuncio = android? ? 'btn_see_add'.type_id : 'seeOffersButton'.type_id
          @localizacaoAnuncio = android? ? 'Pesquisa'.type_text : 'resultCard'.type_id
          @btnEnviarMsgDA = android? ? 'btnSendA'.type_id : 'Enviar mensagem'.type_id
          @btnEnviarMsgEP = android? ? 'btnSendOffer'.type_id : 'Enviar'.type_id
          @btnVerFavoritos = android? ? 'btGoFavored'.type_id : 'Ver Favoritos'.type_id
          @btnbr = android? ?  'Ordenar'.type_text : '(Ordenar'.type_id
          @btn_filter = android? ? 'btn_filter'.type_id : 'Filtrar'.type_id
          @btnfilter = 'btnFilter'.type_id
          @btnSimulate = android? ? 'tvButtonSimulate'.type_id : ''.type_id
          @btnSeeConditions = android? ? 'btnSeeConditions'.type_id : ''.type_id
          @btnContinue = android? ? 'btContinue'.type_id : ''.type_id
          @btnMoto = android? ? 'Motos'.type_text : 'tab_motos'.type_accessibility_id
          @btnVerParcelasMotos = android? ? 'btnSeeConditions'.type_id : 'Ver Parcelas'.type_id
          @cmpMensagem = android? ? 'edtMessage'.type_id : 'messageTextView'.type_id
          @checkBox = android? ? 'checkOffer'.type_id : 'Quero receber contatos da Webmotors por e-mail, WhatsApp e outros canais.'.type_id
          @respostaMsgEnviada = android? ? 'snackbar_text'.type_id : 'Aviso'.type_id
          @opcaoMotos = android? ? 'Motos'.type_id : 'tabMotos'.type_id
          @cbNews = android? ? 'cbNews'.type_id : ''.type_id
          @propostaSucesso = android? ? 'Sua proposta foi enviada com sucesso!'.type_text : 'Sua proposta foi enviada com sucesso!'.type_id
          @meng_atencao = android? ? 'Erro ao processar sua solicitação'.type_text : 'Erro ao processar sua solicitação'.type_id
          @nome = android? ? 'edtNome'.type_id : 'nameField'.type_id
          @email = android? ? 'edtEmail'.type_id : 'mailField'.type_id
          @tel = android? ? 'edtCelular'.type_id : 'phoneField'.type_id
          @cel = android? ? 'edtPhone'.type_id : 'celular'.type_id
          @dt_nasc = android? ? 'edtDateOfBirth'.type_id : ''.type_id
          @fin_CPF = android? ? 'edtCPF'.type_id : ''.type_id
          @localizacao = android? ? 'tvItem'.type_id : ''.type_id
          @est = android? ? 'Acre'.type_text : 'Acre'.type_id
          @bottomsheetfavoritos = android? ? 'ivTop'.type_id : '//XCUIElementTypeApplication[@name="WebmotorsHML"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeOther[1]/XCUIElementTypeOther'.type_xpath
          @lblname = android? ? 'hands.android.webmotors.debug:id/tvName'.type_id : ''.type_id
        end

        def anuncio(num = 0)
          android? ? "Card".type_accessibility_id : "card_#{num.to_s}".type_accessibility_id
        end
    end
end
