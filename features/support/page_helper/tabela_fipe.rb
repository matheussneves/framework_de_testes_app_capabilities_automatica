Dir[File.join("#{Dir.pwd}/features", 'page_objects/*_page.rb')].map { |file| require file }

module PageObjects
    def tabela_fipe
      @tabela_fipe ||= Tabela_Fipe::Tabela_Fipe.new
    end

  end
  