Dir[File.join(File.dirname(__FILE__), '../*_page.rb')].map { |file| require file }

module PageObjects
    def login
      @login ||= Login::Login.new
    end

    def esqueci_minha_senha
      @esqueci_minha_senha ||= Esqueci_Minha_Senha::Esqueci_Minha_Senha.new
    end
  end
  