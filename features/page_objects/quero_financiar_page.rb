module Quero_financiar
    class Quero_financiar
      attr_accessor :btnAllow, :tituloTela
  
        def initialize
          initialize_quero_financiar
        end
  
        def initialize_quero_financiar
          @btnAllow = android? ? 'positive_button'.type_id :  ''.type_id
          @tituloTela = android? ? '//android.view.View[@content-desc="Financiamento"]/android.widget.TextView'.type_xpath :  ''.type_id  
        end
    end
end
  