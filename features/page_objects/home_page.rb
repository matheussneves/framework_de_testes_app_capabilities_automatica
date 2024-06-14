module Home
    class Home
      attr_accessor :iconePerfil,:bannerHome,:iconechat,:itemOfertasFeirao,:itemQueroVender,:btnChat,:btnQueroFinanciar,:btnMeusAnuncios,:btnMeusAnunciosSubMenu,:btnQueroComprar,:btnBuscar,
      :btnMeuVeiculo,:btnCreditoAprovado,:btnfavoritos,:btnSubMenuFavoritos,:btnFavoritosNavBar, :web_suv_catalogo, :btn_carrossel_meu_credito_pre_aprovado, 
      :comp_meu_credito_pre_aprovado, :comp_txtbox_cpf, :comp_chekbox_termos, :comp_btn_descobrir_credito, :btnbuscarveiculo, :btnverservicos, :url_navegador

  
        def initialize
          initialize_home
          initialize_banner_home
          initialize_pre_aprovado
          initialize_carrossel
        end
  
        def initialize_home
          @btnbuscarveiculo = (android? ? 'btSimulateFinanceLabel' : 'Buscar veículo').type_id
          @btnverservicos = ( android? ? 'btMyVehicle' : 'Ver Serviços').type_id
          @iconePerfil = android? ? 'ivProfileLogin'.type_id : 'btn_perfil'.type_accessibility_id
        # ------> Banner home
          @bannerHome = android? ? 'ivProfileLogin'.type_id : 'whiteLogo'.type_accessibility_id
        # ------> Icone de menu
          @iconechat = android? ? 'btn_chat'.type_id : 'btn_chat'.type_accessibility_id
        # ------> Menu Ofertas feirão
          @itemOfertasFeirao = 'Ofertas feirão'.type_id
        # ------> Menu quero vender
          
        # ------> Menu chat
          @btnMeusAnuncios = 'Meus anúncios'.type_id
          @btnMeusAnunciosSubMenu = (android? ? 'llMyAds': 'Meus anúncios').type_id
        # ------> Quero comprar
          @url_navegador =  (android? ? 'com.android.chrome:id/url_bar' : '' ).type_id
        # ------> Buscar
          @btnBuscar = android? ? 'navigation_search'.type_id : 'Buscar'.type_accessibility_id
        # ------> Meu Veiculo
          @btnMeuVeiculo = 'navigation_my_vehicles'.type_id
        # ------> Meu credito pre aprovado
          @btnCreditoAprovado = 'Meu crédito pré-aprovado'.type_id
        # -------> Favorito Carrosel
          @btnfavoritos =  'navigation_favorite'.type_id
        # ------> Favorito Sub Menu
          @btnSubMenuFavoritos = 'Favoritos'.type_accessibility_id
        # ------> Favorito navBar
          @btnFavoritosNavBar = android? ? 'navigation_favorite'.type_id : 'Favoritos'.type_accessibility_id
        end

        def initialize_banner_home
          @web_suv_catalogo = android? ? "com.android.chrome:id/url_bar".type_id : ''.type_text
        end

        def initialize_carrossel
          @btn_carrossel_meu_credito_pre_aprovado = (android? ? "rvMenu" : 'collectionView_cell' ).type_id
          @btnQueroFinanciar = 'Quero financiar'.type_accessibility_id
          @btnQueroComprar = 'Quero comprar'.type_accessibility_id
          @itemQueroVender = 'Quero vender'.type_accessibility_id
        end

        def initialize_pre_aprovado
          @comp_meu_credito_pre_aprovado = android? ? 'tv_pre_approved_credit_label'.type_id : 'Descubra se você tem crédito pré-aprovado para comprar um veículo, sem compromisso!'.type_id
          @comp_txtbox_cpf = android? ? 'edtCPF'.type_id : 'Digite seu CPF*'.type_id
          @comp_chekbox_termos = android? ? 'accbAcceptTerms'.type_id : 'Descobrir crédito pré-aprovado'.type_id
          @comp_btn_descobrir_credito = android? ? 'btnFilter'.type_id : 'Descobrir crédito pré-aprovado'.type_id
        end

    end
end
  