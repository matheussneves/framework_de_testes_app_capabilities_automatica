module Favoritos
    class Favoritos
      attr_accessor :btnOrdenar, :buscarOfertas, :favoritarDA, :btnVerAnuncioFavorito, :OrdemAlfabetica, 
      :ordemAlfabetica, :maiorPreco, :menorPreco, :salvosRecentes, :btnCancelar, :btnMotoFav, 
      :anuncioFavoritadoSucesso, :mengOrdenarRecentemente, :mengOrdenarMenorPreco, :mengOrdenarMaiorPreco, 
      :mengOrdenarAlfabetica
  
        def initialize
          initialize_favoritos
        end
  
        def initialize_favoritos
          @btnOrdenar = android? ? 'tvOrder'.type_id : 'Ordenar'.type_id
          @buscarOfertas = android? ? 'btSearch'.type_id : 'Buscar ofertas'.type_id
          @favoritarDA = android? ? 'icon'.type_id : 'Dash Heart'.type_id
          @btnVerAnuncioFavorito = android? ? 'btn_see_add'.type_id : 'seeOffersButton'.type_id
          # ------> Text
          @ordemAlfabetica = android? ? 'Ordem Alfabética'.type_text : 'Ordem Alfabética'.type_id
          @maiorPreco = android? ? 'Maior Preço'.type_text : 'Maior Preço'.type_id
          @menorPreco = android? ? 'Menor Preço'.type_text : 'Menor Preço'.type_id
          @salvosRecentes = android? ? 'Salvos recentemente'.type_text : 'Salvos recentemente'.type_id
          @btnCancelar = android? ? 'CANCELAR'.type_text : 'CANCELAR'.type_text
          @btnMotoFav = android? ? 'Motos'.type_text : 'tabMotos'.type_id
          # ------> Mensagens
          @anuncioFavoritadoSucesso = android? ? 'tvTitle'.type_id : 'tvTitle'.type_id
          @mengOrdenarRecentemente = android? ? 'Ordenado por: Salvos recentemente'.type_text : 'Ordenado por: Salvos recentemente'.type_id
          @mengOrdenarMenorPreco = android? ? 'Ordenado por: Menor Preço'.type_text : 'Ordenado por: Menor Preço'.type_id
          @mengOrdenarMaiorPreco = android? ? 'Ordenado por: Maior Preço'.type_text : 'Ordenado por: Maior Preço'.type_id
          @mengOrdenarAlfabetica = android? ? 'Ordenado por: Ordem Alfabética'.type_text : 'Ordenado por: Ordem Alfabética'.type_id
      
        end
  
      def clicar_btnCancelar
        @btnCancelar.clicar(90)
      end
  
      def clicar_aba_moto
        @btnMotoFav.clicar(90)
      end
      # ------> Validacoes
      def validar_adicionar_favoritos
        @anuncioFavoritadoSucesso.esperar(90).visivel?
      end
    end
end
  