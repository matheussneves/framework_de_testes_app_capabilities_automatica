Dir[File.join("#{Dir.pwd}/features", 'page_objects/*_page.rb')].map { |file| require file }

module PageObjects
    def meus_anuncios
      @meus_anuncios ||= Meus_Anuncios::Meus_Anuncios.new
    end
  end
  