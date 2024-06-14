module Login
    class Login
      attr_accessor :btnEntendi, :inputEmail, :inputSenha, :btnEntrar, :iconeFacebook, :btnEntrarfacebook, :inputEmailFacebook, :inputSenhaFacebook, :iconeGoogle, :usuarioNovo, :inputEmailGoogle, :inputSenhaGoogle, :btnProximo, :bemVindoGoogle, :linkEsqueciMinhaSenha, :aceiteTermos, :recusarInclusaoConta, :btnfechado, :msgErro, :link_fale_com_a_gente,
      :copi

        def initialize
          initialize_login
        end
  
        def initialize_login
          @btnEntendi = 'Entendi'.type_text
        # ------> Inputs e botoes
          @btnfechado = android? ? 'hands.android.webmotors.debug:id/btClose'.type_id : 'Email'.type_accessibility_id
          @inputEmail = android? ? 'etEmail'.type_id : 'Email'.type_accessibility_id
          @inputSenha = android? ? 'etPassword'.type_id : 'Senha'.type_accessibility_id
          @btnEntrar = android? ? 'btLogin'.type_id : 'Entrar'.type_accessibility_id
          @iconeFacebook = android? ? 'cvFb'.type_id : '//XCUIElementTypeButton[@name="Entrar com Facebook"]'.type_xpath
          @btnEntrarfacebook = android? ? '//android.widget.Button[@text="Log in"]'.type_xpath : '//XCUIElementTypeButton[@name="Entrar"]'.type_xpath
          @inputEmailFacebook = android? ? '//android.widget.EditText[@resource-id="m_login_email"]'.type_xpath  : '//XCUIElementTypeOther[@name="principal"]/XCUIElementTypeTextField'.type_xpath
          @inputSenhaFacebook = android? ? '//android.widget.EditText[@resource-id="m_login_password"]'.type_xpath  : '//XCUIElementTypeOther[@name="principal"]/XCUIElementTypeSecureTextField'.type_xpath
          @iconeGoogle = android? ? 'tvGoogle'.type_id : '//XCUIElementTypeButton[@name="Entrar com Google"]'.type_xpath
          @usuarioNovo = android? ? '//android.view.View[@content-desc="Usar outra conta"]'.type_xpath : ''.type_xpath
          @inputEmailGoogle = android? ? '//android.widget.EditText[@resource-id="identifierId"]'.type_xpath : '//XCUIElementTypeTextField[@name="E-mail ou telefone"]'.type_xpath
          @inputSenhaGoogle = android? ? '//android.widget.EditText[@text=""]'.type_xpath : '//XCUIElementTypeSecureTextField[@name="Digite sua senha"]'.type_xpath
          @btnProximo = android? ? '//android.widget.Button[@text="Próxima"]'.type_xpath : ''.type_xpath
          @bemVindoGoogle = android? ? '//android.widget.TextView[starts-with(@text, "By")]'.type_xpath : ''.type_xpath
          @linkEsqueciMinhaSenha = android? ? 'btForgotPassword'.type_id : '//XCUIElementTypeStaticText[@name="Esqueci minha senha"]'.type_xpath
          @link_fale_com_a_gente = android? ? 'hands.android.webmotors.debug:id/btAction'.type_id : ''.type_id
          @copi = android? ? 'android.webkit.WebView'.type_class : ''.type_id
          # ------> Termos do google
          @aceiteTermos = android? ? '//android.widget.Button[@text="Accept & continue"]'.type_xpath : ''.type_xpath
          @recusarInclusaoConta = android? ? '//android.widget.Button[@text="No thanks"]'.type_xpath : ''.type_xpath
        # ------> Mensagem de texto
          @msgErro = android? ? '//android.widget.FrameLayout/android.view.ViewGroup/android.widget.LinearLayout/android.widget.TextView[1]'.type_xpath : '//XCUIElementTypeStaticText[@name="E-mail ou senha inválidos! :("]'.type_xpath
        end

        def fazer_login(user)
          usuario = selecionar_usuario(carregar_massa("usuarios",user))
          entendi unless inputEmail.visivel?
          @inputEmail.digitar(usuario.email)
          @inputSenha.digitar(usuario.senha)
          @btnEntrar.scroll.clicar
          if usuario.profiles.include?('valido')
            wait_for_until(120) { !@inputEmail.buscar}
            puts("Logando com o email: #{usuario.email} e a senha: #{usuario.senha}")
          end
          return usuario
        end

        def fazer_login_pelo_facebook(user)
          usuario = selecionar_usuario(carregar_massa("usuarios",user))
          entendi
          @iconeFacebook.clicar
          @inputEmailFacebook.digitar(usuario.email)
          @inputSenhafacebook.digitar(usuario.senha)
          @btnEntrarfacebook.clicar
        end
      
        def fazer_login_pelo_google(user)
          usuario = selecionar_usuario(carregar_massa("usuarios",user))
          entendi
          @iconeGoogle.clicar
          if @bemVindoGoogle.visivel?
            @aceiteTermos.clicar
            @recusarInclusaoConta.clicar
          end
          @inputEmailGoogle.digitar(usuario.email)
          @btnProximo.clicar
          @inputSenhaGoogle.digitar(usuario.senha)
          close_keyboard
          @btnProximo.clicar
        end

        def entendi
          @btnEntendi.clicar if @btnEntendi.esperar(10).visivel?
        end

        def selecionar_usuario(massa)
          massa.class.eql?(Array) ? massa[rand((massa.length - 1))] : massa
        end
    end
end
  
