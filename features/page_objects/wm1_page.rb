module WM1
    class WM1
      attr_accessor :lbl_titulo, :lbl_titulo_noticias
  
        def initialize
          initialize_wm1
          initialize_noticias_wm1
        end
  
        def initialize_wm1
          @lbl_titulo = android? ? 'WM1'.type_accessibility_id : ''.type_accessibility_id
        end
        def initialize_noticias_wm1
          @lbl_titulo_noticias = android? ? 'Notícia WM1'.type_text : ''.type_accessibility_id
        end
    end
end
  