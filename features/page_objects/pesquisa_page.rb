module Pesquisa
    class Pesquisa
      attr_accessor :btn_ver_favoritos
  
        def initialize
          initialize_pesquisa
        end
  
        def initialize_pesquisa
          @btn_ver_favoritos = android? ? 'hands.android.webmotors.debug:id/btGoFavored'.type_id : 'Ver Favoritos'.type_accessibility_id
        end
    end
end
  


