module Tabela_Webmotors
    class Tabela_Webmotors
      attr_accessor :lbl_titulo

  
        def initialize
          initialize_tabela_Webmotors
        end
  
        def initialize_tabela_Webmotors
          @lbl_titulo = android? ? 'Tabela Webmotors'.type_text : 'TABELA WEBMOTORS'.type_id
        end
    end
end
  