module Meus_Anuncios
    class Meus_Anuncios
      attr_accessor :filtrarAguardandoPagamento, :btnAlterarStatus, :btnExcluir, :btnExcluirAnuncio, :btnFiltrar, :filtrarAnuncioAtivo,
      :filtrarDadosIncompletos, :filtrarConfirmaPagamento, :filtrarAnuncioDesativado, :filtrarAnuncioExcluido,
      :filtrarAnuncioAnalise, :filtrarOutros, :btnfechar, :opcaoParaDesabilitar, :confirmarAnuncioDesabilitado, :lblstatus
  
        def initialize
          initialize_meus_anuncios
        end
  
        def initialize_meus_anuncios
          @lblstatus = android? ? 'hands.android.webmotors.debug:id/txtStatus'.type_id : 'Anúncio ativo'.type_id
          @filtrarAguardandoPagamento = android? ? 'Aguardando pagamento'.type_text : 'Aguardando pagamento'.type_id
          @btnAlterarStatus = android? ? 'swtChangeEnabled'.type_id : '(//XCUIElementTypeSwitch[@value="1"])[1]'.type_id
          @btnFiltrar = android? ? 'tvOrder'.type_id : 'Filtrar'.type_id
          @filtrarAnuncioAtivo = android? ? 'Anúncio ativo'.type_text : 'Anúncio ativo'.type_id
          @filtrarDadosIncompletos = android? ? 'Dados incompletos'.type_text : 'Dados incompletos'.type_id
          @filtrarConfirmaPagamento = android? ? 'A confirmar pagamento'.type_text : 'A confirmar pagamento'.type_id
          @filtrarAnuncioDesativado = android? ? 'Anúncio desativado'.type_text : 'Anúncio desativado'.type_id
          @filtrarAnuncioExcluido = android? ? 'Anúncio excluído'.type_text : 'Anúncio excluído'.type_id
          @filtrarAnuncioAnalise = android? ? 'Em análise de qualidade'.type_text : 'Anúncio em análise'.type_id
          @filtrarOutros = android? ? 'Outros'.type_text : 'Outros'.type_id
          @btnfechar = 'Fechar'.type_id
          @opcaoParaDesabilitar = android? ? 'Não. Desisti de vender'.type_text : ''.type_id
          @confirmarAnuncioDesabilitado = android? ? 'Sim'.type_text : ''.type_id
          @btnExcluir = android? ? 'clDelete'.type_id : ''.type_id
          @btnExcluirAnuncio = android? ? 'btOK'.type_id : ''.type_id
        end
        
      
        def clicar_excluir
          @btnAlterarStatus.clicar(90)
          @btnExcluir.esperar
          @btnExcluir.clicar
        end
      
        def click_btn_fechar
          @btnfechar.clicar(90)
        end
      
        def validar_anuncio_excluido
          @filtrarAnuncioExcluido.esperar(90).texto
        end
      
        def validar_status_anuncio_desabilitado
          if @statusHabilitadoDesabilitado.esperar(10).texto == "Anúncio ativo"
            @btnAlterarStatus.clicar(10)
            @opcaoParaDesabilitar.clicar(10)
            @confirmarAnuncioDesabilitado.clicar(10)
          else
            puts "Desativado"
          end
        end
      
        def validar_status_anuncio_habilitado
          if @statusHabilitadoDesabilitado.esperar(50).texto == "Desativado"
          @btnAlterarStatus.clicar(90)
          else
            puts "Anúncio ativo"
          end
        end
    end
end
  