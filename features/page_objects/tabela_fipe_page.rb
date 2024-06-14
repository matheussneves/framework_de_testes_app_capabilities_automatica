module Tabela_Fipe
  class Tabela_Fipe
    attr_accessor :lbltitulo, :abacarros, :abamotos, :cmpmarca, :cmpmodelo, :cmpversao, :cmpestado, :cmpblindado, :cmplimpar, :cmpavaliar, :lbltitulo_ra, :lblatualizacaowm,
    :minbr, :minstate, :medbr, :medstate, :maxbr, :maxstate, :lblatualizacaofipe, :btnvendermeucarro, :btnverofertas, :lblvalorfipe, :cmpbusca, :cmplimparcampo, :cmpanomodelo

      def initialize
        initialize_tabela_fipe
        initialize_resultado_avaliacao
        initialize_busca
      end

      def initialize_tabela_fipe
       @lbltitulo = 'tvTitle'.type_id
       @abacarros = 'filter_fipe_search_car_tab'.type_id
       @abamotos = 'filter_fipe_search_bike_tab'.type_id
       @cmpmarca = 'Marca'.type_text
       @cmpmodelo = 'Modelo'.type_text
       @cmpanomodelo = 'Ano Modelo'.type_text
       @cmpversao = 'Versão'.type_text
       @cmpestado = 'Estado'.type_text
       @cmpblindado = 'wmTrackId'.type_id
       @cmplimpar = 'btnClear'.type_id
       @cmpavaliar = 'btnEvaluate'.type_id
       @cmplimparcampo = 'imgClose'.type_id
      end

      def initialize_resultado_avaliacao
        @lbltitulo_ra = 'tvActionBarTitle'.type_id
        @lblatualizacaowm = 'tvDateWebMotorsTable'.type_id
        @minbr = 'tvMinBrazil'.type_id
        @minstate = 'tvMinState'.type_id
        @medbr = 'tvMedBrazil'.type_id
        @medstate = 'tvMedState'.type_id
        @maxbr = 'tvMaxBrazil'.type_id
        @maxstate = 'tvMaxState'.type_id
        @lblatualizacaofipe = 'tvDateFipeTable'.type_id
        @btnvendermeucarro = 'btnSellCar'.type_id
        @btnverofertas = 'btnShowOffers'.type_id
        @lblvalorfipe = 'tvFipeValue'.type_id
       end

       def initialize_busca
        @cmpbusca = 'edtSearchFilter'.type_id
       end

       def tab(tab)
        tab.downcase.eql?('carro') ? @abacarros : @abamotos
       end

       def prencher_busca(texto) 
        @cmpbusca.esperar.digitar(texto, false)
        texto.to_s.type_text.esperar.buscar_elementos[1].clicar
       end
  end
end
