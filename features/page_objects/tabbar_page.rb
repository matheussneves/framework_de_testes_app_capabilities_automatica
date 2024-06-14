module TabBar
    class TabBar
      attr_accessor :inicio, :buscar, :favoritos, :menu, :servicos ,:home
  
        def initialize
          initialize_tabbar
        end
  
        def initialize_tabbar
         @inicio = android? ? 'Início'.type_accessibility_id : 'Início'.type_id
         @buscar = android? ? 'Buscar'.type_accessibility_id : 'Buscar'.type_id
         @favoritos = android? ? 'Favoritos'.type_accessibility_id : 'Favoritos'.type_id
         @menu = android? ? 'Menu'.type_accessibility_id : 'Menu'.type_id
         @servicos = android? ? 'Serviços'.type_accessibility_id : 'Serviços'.type_id
         @home = android? ? 'Início'.type_accessibility_id : 'Início'.type_id
        end
    end
end
  