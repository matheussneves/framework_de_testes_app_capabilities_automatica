module Menu
    class Menu
      attr_accessor :lbl_titulo, :btnLogout, :btnEntrar

        def initialize
          initialize_menu
        end
  
        def initialize_menu
          @lbl_titulo = (android? ? 'tvActionBarTitle' : 'Configurações').type_id
          @btnLogout = (android? ? 'btnLogOut' : 'Sair').type_id
          @btnEntrar = (android? ? 'btnLogOut' : 'Entrar').type_accessibility_id
        end
    end
end
  