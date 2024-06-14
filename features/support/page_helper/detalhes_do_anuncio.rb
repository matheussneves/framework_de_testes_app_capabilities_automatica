Dir[File.join("#{Dir.pwd}/features", 'page_objects/*_page.rb')].map { |file| require file }

module PageObjects
    def detalhes_do_anuncio
      @detalhes_do_anuncio ||= Detalhes_Do_Anuncio::Detalhes_Do_Anuncio.new
    end

  end
  