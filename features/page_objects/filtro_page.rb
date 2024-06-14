module Filtro
  class Filtro
    attr_accessor :btn_filter, :btnfilter

    def initialize
      initialize_filtro
    end

    def initialize_filtro
      @btn_filter = android? ? 'btn_filter'.type_id : 'Filtrar'.type_id
      @btnfilter = 'btnFilter'.type_id
    end

    def filtrar(perfil)
      veic = carregar_massa("filtro", perfil.downcase)
      veic.veiculo.downcase.capitalize.type_text.clicar(20)
      @btn_filter.clicar(40)
      veic.filtros.to_h.each do |key, value|
        next if value.valor.eql?('')
        value.nome.type_accessibility_id.scroll(5) unless value.nome.type_accessibility_id.esperar(2).visivel?
        value.nome.type_accessibility_id.clicar(2)
        buscar = (android? ? 'Digite sua busca'.type_text : value.nome.type_id )
        value.valor = [value.valor] if value.valor.class.eql?(String)
        value.valor.each do |sele|
          if buscar.esperar(5).visivel?
            buscar.clicar(5)
            buscar.digitar(sele, true, false)
            sele.type_accessibility_id.esperar(4).clicar(5)
          else
              sele.type_accessibility_id.scroll(4).clicar(5)
          end
          'CONFIRMAR'.type_text.clicar(1) if 'CONFIRMAR'.type_text.visivel?
        end
          btn = android? ?  'OK' : 'CONFIRMAR'
          btn.type_text.clicar(1) if btn.type_text.visivel?
      end
          android? ? @btnfilter.scroll(5).clicar(5) : @btnfilter.scroll(5).buscar_elementos[1].clicar(5)
    end
  end
end
  


