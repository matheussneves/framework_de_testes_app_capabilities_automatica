Dir[File.join(File.dirname(__FILE__), '../*_page.rb')].map { |file| require file }

module PageObjects
    def tabela_webmotors
      @tabela_webmotors ||= Tabela_Webmotors::Tabela_Webmotors.new
    end

  end
  