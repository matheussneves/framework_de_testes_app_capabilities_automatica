module Detalhes_Do_Anuncio
  class Detalhes_Do_Anuncio
    attr_accessor :titulo, :favorito, :compartilhar, :voltar, :aba_veiculo, :imagem, :lblresponde_rapido, :lbltitulo, :lblversao, :lblvalor, :btnverparcela, :lblcidade, :lblano, :lblkm, :lblcor, :lblcarroceria, :lblportas, :lblcambio, :lblfinalplaca, :lblcombustivel, :lblblindado, 
    :cmpitensdoveiculo, :lblvideochamada, :btnvideochamada, :lblsobreveiculo, :btndenunciar, :abavendedor, :fotovendedor, :lblnomevendedor, :lbllocalvendedor, :lblconquistas, :btnveranunciosdestevendedor, :abafipe, :btnverparcelafooter, :btnchamada, :btnenviarmensagem, :popupfavoritado, 
    :popupdesfavoritado, :popupdesfavoritar, :nativocompartilhar,:dadospessoais, :telefone, :numtelefone, :dotimg, :imgfull, :dotimgfull, :imgclose, :horarioatendimento, :maisdetalhes, :btnVisualizarLauco, :tituloLaudoVistoriado, :saibaMais, :validarCokpit, :ver360, :fechar360,
    :phoneemulador, :phonereal

      def initialize
        initialize_detalhes_do_anuncio_header
        initialize_detalhes_do_anuncio_veiculo
        initialize_detalhes_do_anuncio_vendedor
        initialize_detalhes_do_anuncio_footer
        initialize_detalhes_do_anuncio_popup
        initialize_detalhes_do_anuncio_vistoriado360
      end

      def initialize_detalhes_do_anuncio_header
       @titulo = 'tvTitle'.type_id
       @favorito = android? ? 'hands.android.webmotors.debug:id/btHeart'.type_id : 'Dash Heart'.type_id
       @compartilhar = 'hands.android.webmotors.debug:id/btShare'.type_id
       @voltar = 'hands.android.webmotors.debug:id/arrowBack'.type_id
      end

      def initialize_detalhes_do_anuncio_veiculo
        @imagem = 'hands.android.webmotors.debug:id/imageView'.type_id
        @imgclose = 'hands.android.webmotors.debug:id/ivCloseIcon'.type_id
        @imgfull = 'hands.android.webmotors.debug:id/view_pager'.type_id
        @dotimg = '//android.widget.HorizontalScrollView[@resource-id="hands.android.webmotors.debug:id/into_tab_layout"]/android.widget.LinearLayout/android.widget.LinearLayout'.type_xpath
        @dotimgfull = 'hands.android.webmotors.debug:id/spring_dot'.type_id
        @lblresponde_rapido = 'hands.android.webmotors.debug:id/info_response_seller_label'.type_id
        @lbltitulo = 'hands.android.webmotors.debug:id/txtNameAd'.type_id
        @lblversao = 'hands.android.webmotors.debug:id/txtVesionAd'.type_id
        @lblvalor = 'hands.android.webmotors.debug:id/txtPrice'.type_id
        @btnverparcela = 'hands.android.webmotors.debug:id/btSeeFinanceB'.type_id
        @lblcidade = 'Campinas, São Paulo (SP)'.type_text
        @lblano = '2011/2012'.type_text
        @lblkm = '89.000'.type_text
        @lblcor = 'Branco'.type_text
        @lblcarroceria = 'Cupê'.type_text
        @lblportas = '2'.type_text
        @lblcambio = 'Automática Sequencial'.type_text
        @lblfinalplaca = '4'.type_text
        @lblcombustivel = 'Gasolina'.type_text
        @lblblindado = 'Não'.type_text
        @cmpitensdoveiculo = 'Airbag'.type_text
        @lblvideochamada = 'hands.android.webmotors.debug:id/tvAlertVideoCall'.type_id
        @btnvideochamada = 'hands.android.webmotors.debug:id/btVideoCall'.type_id
        @lblsobreveiculo = 'txtObservacoes'.type_text
        @btndenunciar = 'tvReport'.type_text
      end

      def initialize_detalhes_do_anuncio_vendedor
        @fotovendedor = 'hands.android.webmotors.debug:id/acivPhoto'.type_id
        @lblnomevendedor = 'hands.android.webmotors.debug:id/tvName'.type_id
        @lbllocalvendedor = 'hands.android.webmotors.debug:id/tvLocation'.type_id
        @lblconquistas = 'hands.android.webmotors.debug:id/rvAchievements'.type_id
        @btnveranunciosdestevendedor = 'hands.android.webmotors.debug:id/btSeeAdsSeller'.type_id
        @horarioatendimento = 'hands.android.webmotors.debug:id/actvTitleHours'.type_id
      end

      def initialize_detalhes_do_anuncio_footer
        @btnverparcelafooter = 'hands.android.webmotors.debug:id/btnSimulate'.type_id
        @btnchamada = 'hands.android.webmotors.debug:id/btnCallA'.type_id
        @phoneemulador = android? ? 'com.android.dialer:id/contactgrid_avatar'.type_id : ''.type_id
        @phonereal = android? ? 'com.android.dialer:id/contactgrid_avatar'.type_id : ''.type_id
        @btnenviarmensagem = 'hands.android.webmotors.debug:id/btnSendA'.type_id
      end

      def initialize_detalhes_do_anuncio_popup
        @popupfavoritado = 'hands.android.webmotors.debug:id/clContainer'.type_id
        @popupdesfavoritado = 'hands.android.webmotors.debug:id/clContainer'.type_id
        @popupdesfavoritar = 'hands.android.webmotors.debug:id/tvUndo'.type_id
        @nativocompartilhar = '//android.widget.ScrollView[@resource-id="android:id/contentPanel"]/android.widget.RelativeLayout'.type_xpath
        @dadospessoais = 'hands.android.webmotors.debug:id/tvMandatory'.type_id
        @telefone = 'com.android.dialer:id/incall_ui_container'.type_id
        @numtelefone = '(//android.widget.RelativeLayout[@resource-id="hands.android.webmotors.debug:id/relativeListBackground"])[1]'.type_xpath
      end

      def initialize_detalhes_do_anuncio_vistoriado360
        @maisdetalhes = 'Mais detalhes'.type_text
        @btnVisualizarLauco = android? ? 'acbViewReport'.type_id : 'Visualizar laudo'.type_text
        @tituloLaudoVistoriado = android? ? 'hands.android.webmotors.debug:id/vTitle'.type_id : 'UIView'.type_text
        @saibaMais = android? ? 'hands.android.webmotors.debug:id/tvKnowMoreBuyCertified'.type_id : 'Dúvidas sobre o Vistoriado? Saiba mais'.type_text
        @validarCokpit = 'VISTORIADO'.type_text
        @ver360 = android? ? 'iv_vehicle360'.type_id : 'Ver 360°'.type_text
        @fechar360 = 'hands.android.webmotors.debug:id/btClose'.type_id
      end 
  end
end
