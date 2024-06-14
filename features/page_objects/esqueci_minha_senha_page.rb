module Esqueci_Minha_Senha
    class Esqueci_Minha_Senha
      attr_accessor :emailEsqueciSenha, :btnRedefinirSenha, :btnContinuar, :btnEntendi, :telaCodigo
  
        def initialize
          initialize_esqueci_minha_senha
        end
  
        def initialize_esqueci_minha_senha
          @emailEsqueciSenha = android? ? '//android.widget.EditText[@text="Digite seu e-mail"]'.type_xpath : '//XCUIElementTypeTextField[@value="Digite seu e-mail*"]'.type_xpath
          @btnRedefinirSenha = android? ? 'btContinue'.type_id : 'Redefinir senha'.type_id
          @btnContinuar = android? ? '//android.widget.Button[@text="Continuar"]'.type_xpath : 'Continuar'.type_id
          @btnEntendi = android? ? 'btConfirm'.type_id : 'btConfirm'.type_id
          @telaCodigo = android? ? '//android.widget.TextView[@text="Digite o código:"]'.type_xpath : 'Digite o código:'.type_id
         end

        
    end
end
  