module Quero_Vender
    class Quero_Vender
      attr_accessor :tituloPagTermoAdesao, :tituloPagPagamentoCartao, :tituloPagPagamentoBoleto, :tituloPagPagamentoPix, :tituloPagPagamentoPixSucesso, :ValorReservado, :btnComecarAnuncio,
      :btnCarro, :btnMoto, :btnSair, :btnContinuarPlacaPagamento, :btnContinuarDados, :btnContinuarOpcionaisCarac, :btnContinuarKmPrecoFoto, :btnConfirmarSelect, :btnContinuePhone, :btnSelecionarPlano,
      :btnEntendi, :btnOkCep, :btnFinalizar, :btnPix, :btnCopiarPix, :btnVerAnuncio, :adicionarPlaca, :selecionarOpcaoBoleto, :alterarCep, :inserirCep, :cmpTextLupa, :cmpResultadoPesquisa, :cmpMarca,
      :cmpModelo, :cmpVersao, :cmpCombustivel, :cmpPortas, :cmpCor, :cmpCambio, :cmpOpcionaisCaracteristicas, :cmpKmPreco, :cmpCartao, :cmpNomeCartao, :cmpNumeroCartao, :cmpValidadeCartao, :cmpCodigoCartao,
      :cmpCorPrimaria, :cmpCorSecundaria, :cmpAlimentacao, :cmpRefrigeracao, :cmpMotor, :cmpPartida, :cmpFreio, :cmpMarcha, :cmpNomeBoleto, :cmpEnderecoBoleto, :cmpNumeroBoleto, :cmpComplementoBoleto,
      :lupa, :checkBoxTermoDeAdesao, :checkBoxAceito, :checkBoxTelefone, :btnPagamentoSucesso, :btnPagamentoErro, :cmpKmPreco2, :criaranuncio, :btnpaypix
  
        def initialize
          initialize_quero_vender
        end
  
        def initialize_quero_vender
          @tituloPagTermoAdesao = android? ? 'tvTitle'.type_id : ''.type_id
          @tituloPagPagamentoCartao = android? ? 'tvActionBarTitle'.type_id : ''.type_id
          @tituloPagPagamentoBoleto = android? ? 'tvTitle'.type_id : ''.type_id
          @tituloPagPagamentoPix = android? ? 'tvSubtitle'.type_id : ''.type_id
          @tituloPagPagamentoPixSucesso = android? ? '//android.widget.FrameLayout/android.view.ViewGroup[3]/android.widget.ScrollView/android.widget.LinearLayout/android.widget.TextView[1]'.type_xpath : ''.type_id
          @ValorReservado = android? ? 'tvSubtitle'.type_id : ''.type_id
          @btnComecarAnuncio = android? ? 'btnStartAnnouncement'.type_id : ''.type_id
          @btnCarro = android? ? 'btnSelectCar'.type_id : 'CarSellIImage'.type_id
          @btnMoto = android? ? 'btnSelectBike'.type_id : 'MotocycleSellImage'.type_id
          @btnSair = android? ? 'tvExit'.type_id : ''.type_id
          @btnContinuarPlacaPagamento = android? ? 'buttonGoNext'.type_id : 'continueButton'.type_id
          @btnContinuarDados = android? ? 'btnGoNext'.type_id : 'continueButton'.type_id
          @btnContinuarOpcionaisCarac = android? ? 'btnContinuar'.type_id : 'CONTINUAR'.type_id
          @btnContinuarKmPrecoFoto = android? ? 'btnNext'.type_id : 'CONTINUAR'.type_id
          @criaranuncio = android? ? 'btnNext'.type_id : 'Criar anúncio'.type_id
          @btnConfirmarSelect = android? ? 'btnConfirmSelect'.type_id : 'SELECIONAR (3)'.type_id
          @btnContinuePhone = android? ? 'btConfirm'.type_id : 'Continuar'.type_id
          @btnSelecionarPlano = android? ? 'btnSellPlan'.type_id : 'Escolher o Plus'.type_id
          @btnEntendi = android? ? 'btnFinish'.type_id : ''.type_id
          @btnOkCep = android? ? 'btnOk'.type_id : ''.type_id
          @btnFinalizar = android? ? 'btnFinalize'.type_id : ''.type_id
          @btnPix = android? ? 'll_container_pix'.type_id : ''.type_id
          @btnCopiarPix = android? ? 'tvPixCopyCode'.type_id : ''.type_id
          @btnVerAnuncio = android? ? 'btnSee'.type_id : ''.type_id
          @adicionarPlaca = android? ? 'edtPlate'.type_id : 'Placa'.type_accessibility_id
          @selecionarOpcaoBoleto = android? ? 'rb_payment_billet'.type_id : ''.type_id
          @alterarCep = android? ? 'btnSelectState'.type_id : ''.type_id
          @inserirCep = android? ? 'edtInput'.type_id : ''.type_id
          @cmpTextLupa = android? ? 'search_src_text'.type_id : 'busca'.type_id
          @cmpAno =  android? ? 'txtTitleLine'.type_id : 'busca'.type_id
          @cmpResultadoPesquisa = android? ? 'txtListItem'.type_id : '//XCUIElementTypeApplication[@name="WebmotorsHML"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther[4]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell/XCUIElementTypeOther[2]'.type_xpath
          @cmpResultadoPesquisa2 = android? ? 'txtListItem'.type_id : '//XCUIElementTypeApplication[@name="WebmotorsHML"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther[4]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell/XCUIElementTypeOther[3]'.type_xpath
          @cmpResultadoPesquisa3 = android? ? 'txtListItem'.type_id : '//XCUIElementTypeApplication[@name="WebmotorsHML"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther[4]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther'.type_xpath
          @cmpMarca = android? ? 'spnMake'.type_id : 'Selecione a marca'.type_text
          @cmpModelo = android? ? 'spnModel'.type_id : 'Selecione o modelo'.type_text
          @cmpVersao = android? ? 'spnVersion'.type_id : 'Selecionar a versão'.type_id
          @cmpCombustivel = android? ? 'spnFuel'.type_id : 'Selecionar o tipo de combustível'.type_text
          @cmpPortas = android? ? 'spnDoors'.type_id : 'Selecionar a quantidade de portas'.type_text
          @cmpCor = android? ? 'spnColor'.type_id : 'Selecionar a cor'.type_text
          @cmpCambio = android? ? 'spnGearShift'.type_id : 'Selecionar o tipo de câmbio'.type_text
          @cmpOpcionaisCaracteristicas = android? ? 'btnAddItem'.type_id : 'Empty list'.type_id
          @cmpKmPreco = android? ? 'edtEmptyField'.type_id : 'km'.type_text
          @cmpKmPreco2 = android? ? 'edtEmptyField'.type_id : 'R$'.type_text
          @cmpCartao = android? ? 'rb_payment_credit'.type_id : ''.type_id
          @cmpNomeCartao = android? ? 'ed_card_name'.type_id : ''.type_id
          @cmpNumeroCartao = android? ? 'ed_card_number'.type_id : ''.type_id
          @cmpValidadeCartao = android? ? 'edDue'.type_id : ''.type_id
          @cmpCodigoCartao = android? ? 'ed_cvv'.type_id : ''.type_id
          @cmpCorPrimaria = android? ? 'spnColorPrimary'.type_id : 'Selecionar a cor primária'.type_id
          @cmpCorSecundaria = android? ? 'spnColorSecondary'.type_id : 'Selecionar a cor secundária'.type_id
          @cmpAlimentacao = android? ? 'spnAliment'.type_id : 'Selecionar um tipo de alimentação'.type_id
          @cmpRefrigeracao = android? ? 'spnRefrig'.type_id : 'Selecionar um tipo de refrigeração'.type_id
          @cmpMotor = android? ? 'spnEngine'.type_id : 'Selecionar um tipo de motor'.type_id
          @cmpPartida = android? ? 'spnStart'.type_id : 'Selecionar um tipo de partica'.type_id
          @cmpFreio = android? ? 'spnBreak'.type_id : 'Selecionar um tipo de freio'.type_id
          @cmpMarcha = android? ? 'spnMarches'.type_id : 'Selecionar um tipo de marcha'.type_id
          @cmpNomeBoleto = android? ? 'ed_full_name'.type_id : ''.type_id
          @cmpEnderecoBoleto = android? ? 'ed_address'.type_id : ''.type_id
          @cmpNumeroBoleto = android? ? 'ed_number'.type_id : ''.type_id
          @cmpComplementoBoleto = android? ? 'ed_complement'.type_id : ''.type_id
          @lupa = android? ? 'action_search'.type_id : 'busca'.type_id
          @checkBoxTermoDeAdesao = android? ? 'checkAdhesionContract'.type_id : ''.type_id
          @checkBoxAceito = android? ? 'checkPersonalInfo'.type_id : ''.type_id
          @checkBoxTelefone = android? ? 'cbShowPhone'.type_id : 'Exibir meu telefone no anúncio'.type_id
          @btnPagamentoSucesso = android? ? 'btnFinalize'.type_id : 'Pagamento aprovado!'.type_id
          @btnPagamentoErro = android? ? 'simulateWithError'.type_id : ''.type_id
          @btnpaypix = 'hands.android.webmotors.debug:id/rb_payment_pix'.type_id
        end

      
        def preencher_informacoes_Cartao(numero, nome, validade, codigo)
          @cmpCartao.clicar(90)
          @cmpNumeroCartao.digitar(numero)
          @cmpNomeCartao.digitar(nome)
          @cmpValidadeCartao.digitar(validade)
          @cmpCodigoCartao.digitar(codigo)
        end
      
        def preencher_informacoes_boleto(nome, endereco, numero, complemento)
          @cmpNomeBoleto.digitar(nome)
          @cmpEnderecoBoleto.digitar(endereco)
          @cmpNumeroBoleto.digitar(numero)
          @cmpComplementoBoleto.digitar(complemento)
        end
      
        def clicar_btn_sair
          @btnSair.clicar(90)
        end
      
        def preencher_marca(marca)
          @cmpMarca.clicar(90)
          @lupa.clicar(90)
          @cmpTextLupa.digitar(marca)
          @cmpResultadoPesquisa.clicar(90)
        end
      
        def preencher_modelo(modelo)
          @cmpModelo.clicar(90)
          @lupa.esperar.clicar(90)
          @cmpTextLupa.esperar.clicar.digitar(modelo)
          @cmpResultadoPesquisa2.clicar(90)
        end
      
        def preencher_combustivel(gas)
          @cmpCombustivel.clicar(90)
          (android? ? gas.type_text : gas.type_id).clicar(90)
        end
      
        def preencher_versao
          if ios?
            'Ano modelo'.type_text.clicar
            'SELECIONAR'.type_text.clicar
            'Ano fabricação'.type_text.clicar
            'SELECIONAR'.type_text.clicar
          end
          @cmpVersao.clicar(90)
          @cmpResultadoPesquisa3.clicar(90)
        end
      
        def preencher_porta(porta)
          @cmpPortas.clicar(90)
          (android? ? porta.type_text : porta.type_id).clicar(90)
        end
      
        def preencher_cor(cor)
          @cmpCor.clicar(90)
          @lupa.esperar.clicar(90)
          @cmpTextLupa.esperar.clicar.digitar(cor)
          @cmpResultadoPesquisa.esperar.clicar
        end
      
        def preencher_cambio(cambio)
          @cmpCambio.scroll
          @cmpCambio.clicar(90)
          (android? ? cambio.type_text : cambio.type_id).clicar(90)
        end
      
        def adicionar_opcionais_caracteristicas(um, dois, tres)
          (android? ? um.type_text : um.type_id).clicar(90)
          (android? ? dois.type_text : dois.type_id).clicar(90)
          (android? ? tres.type_text : tres.type_id).clicar(90)
        end
      
        def clicar_checkbox_exibir_telefone
          @checkBoxTelefone.clicar(90)
        end
      
        def clicar_btn_continue_telefone
          @btnContinuePhone.clicar(90)
        end
      
        def selecionar_plano
          @btnSelecionarPlano.scroll
          @btnSelecionarPlano.clicar(90)
        end
      
        def clicar_btn_entendi
          @btnEntendi.clicar(90)
        end
      
        def preencher_cor_primaria(cor_um)
          @cmpCorPrimaria.clicar(90)
          cor_um.type_text.clicar(90)
        end
      
        def preencher_cor_secundaria(cor_dois)
          @cmpCorSecundaria.clicar(90)
          cor_dois.type_text.clicar(90)
        end
      
        def preencher_alimentacao(alimentacao)
          @cmpAlimentacao.clicar(90)
          alimentacao.type_text.clicar(90)
        end
      
        def preencher_refrigeracao(refri)
          @cmpRefrigeracao.scroll
          @cmpRefrigeracao.clicar(90)
          refri.type_text.clicar(90)
        end
      
        def preencher_motor(motor)
          @cmpMotor.scroll
          @cmpMotor.clicar(90)
          motor.type_text.clicar(90)
        end
      
        def preencher_partida(partida)
          @cmpPartida.scroll
          @cmpPartida.clicar(90)
          partida.type_text.clicar(90)
        end
      
        def preencher_freio(freio)
          @cmpFreio.scroll
          @cmpFreio.clicar(90)
          freio.type_text.clicar(90)
        end
      
        def preencher_marcha(marcha)
          @cmpMarca.esperar
          @cmpMarcha.scroll
          @cmpMarcha.clicar(90)
          marcha.type_text.clicar(90)
        end
      
        def alterar_cep(cep)
          @alterarCep.clicar(90)
          @inserirCep.esperar.clicar.digitar(cep)
          @btnOkCep.clicar(90)
        end

        def clicar_btn_pagamento_erro
          @btnPagamentoErro.clicar(90)
        end
          
        def validar_texto_tela_sucesso_cartao
          @ValorReservado.esperar(90).texto
        end
      
        def validar_titulo_tela_pagamento_anunciar_veiculo_boleto
          @tituloPagPagamentoBoleto.esperar(90).texto
        end

        def clicar_tipo_veiculo(veic)
          ele = veic.downcase.include?('carro') ? @btnCarro : @btnMoto
          ele.esperar.clicar
        end

        def loop_selecionar(valor)
          valor = [valor] unless valor.class.eql?(Array)
          valor.each do |sele|
            ele = android? ? sele.type_text : sele.type_id
              unless ele.esperar(3).visivel?
                @lupa.esperar.clicar(10) if android?
                @cmpTextLupa.esperar(10).clicar.digitar(sele, true, true)
                @cmpResultadoPesquisa.esperar_elemento_visivel.esperar_elemento_ativo.clicar(10)
              else
                ele.esperar_elemento_visivel.esperar_elemento_ativo.clicar
              end
          end
        end

        def selecionar_complementos(comp, tipo)
          comp.chave.type_text.esperar(10).clicar
          loop_selecionar(comp.valor)
          (android? ? 'Confirmar' : "SELECIONAR (#{comp.valor.length})" ).type_text.scroll.esperar.clicar
          @btnContinuarOpcionaisCarac.scroll(2) unless @btnContinuarOpcionaisCarac.esperar(2).visivel?
          @btnContinuarOpcionaisCarac.esperar.buscar_elementos[tipo.eql?('opcionais') ? 0 :(android? ? 0 :  1)].clicar
        end

        def selecionar_dados_veiculo(dados)
          dados.to_h.each do |key, value|
            chave = value.chave
            valor = value.valor
            unless chave.include?('Ano')
              chave.type_text.esperar_elemento_visivel(5)
              (valor.type_text.scroll(1) unless key.to_s.eql?('opcao1')) if android? ? !chave.type_text.visivel? : valor.type_text.visivel?
              next if android? ? !page_text.include?(chave): page_text.include?(valor)
              value.chave.type_text.esperar.clicar
              loop_selecionar(valor)
            else
              if android?
                @cmpAno.esperar.buscar_elementos[(value.chave.eql?('Ano modelo') ? 0 : 1)].clicar
                value.valor.type_text.clicar
              else
                chave.type_text.esperar.clicar
                'SELECIONAR'.type_text.esperar.clicar
              end
            end
          end
          @btnContinuarDados.scroll(2) unless @btnContinuarDados.esperar(2).visivel?
          @btnContinuarDados.esperar.buscar_elementos[android? ? 0 : 2].clicar
        end

        def preencher_dados_veiculo(profile)
          veic = carregar_massa("dados_veiculo", profile.downcase)
          clicar_tipo_veiculo(veic.veiculo)
          @adicionarPlaca.esperar_elemento_visivel
          @adicionarPlaca.esperar(20).digitar(veic.placa.downcase.eql?('gerar') ? gerar_placa(veic.veiculo) : veic.placa)
          @btnContinuarPlacaPagamento.esperar(5).clicar
          wait_for_until(10) { !@btnContinuarPlacaPagamento.visivel? }
          selecionar_dados_veiculo(veic.dados)
          selecionar_complementos(veic.opcionais, 'opcionais' )
          selecionar_complementos(veic.caracteristica, 'caracteristicas')
          @cmpKmPreco.esperar_elemento_visivel.esperar_elemento_ativo.digitar(veic.km)
          @btnContinuarKmPrecoFoto.buscar_elementos[android? ? 0 :6].clicar
          @cmpKmPreco2.esperar_elemento_visivel.esperar_elemento_ativo.digitar(veic.valor)
          @btnContinuarKmPrecoFoto.buscar_elementos[android? ? 0 :7].clicar
        end

        def pagar(perfil)
          pag = carregar_massa("pagamento", perfil.downcase)
          if android?
            @alterarCep.esperar.clicar
            @inserirCep.esperar.digitar(pag.cep)
            'OK'.type_text.esperar.clicar
          end
          "Escolher o #{pag.plano}".type_text.esperar(5).scroll.esperar.clicar
          if android?
            case pag.meio_de_pagamento.downcase
            when 'pix'
              pag.meio_de_pagamento.upcase.type_text.scroll.esperar.clicar
            when 'cartao'
              'Cartão de crédito'.type_text.scroll.esperar.clicar
              @cmpNumeroCartao.esperar.digitar(pag.numero)
              @cmpNomeCartao.esperar.digitar(pag.nome)
              @cmpValidadeCartao.esperar.digitar(pag.vencimento)
              @cmpCodigoCartao.esperar.digitar(pag.cvv)
            when 'boleto'
              pag.meio_de_pagamento.downcase.capitalize.type_text.scroll.esperar.clicar
              @cmpNomeBoleto.digitar(pag.nome)
              @cmpEnderecoBoleto.digitar(pag.endereco)
              @cmpNumeroBoleto.digitar(pag.numero_end)
              @cmpComplementoBoleto.digitar(pag.complemento)
            end
            @btnFinalizar.scroll.esperar.clicar
          else
            'simulateWithSuccess'.type_id.clicar
          end
        end
    end
end
