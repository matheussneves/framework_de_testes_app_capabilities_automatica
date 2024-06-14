Dir[File.join("#{Dir.pwd}/features", 'page_objects/*_page.rb')].map { |file| require file }

module PageObjects
    def quero_comprar
      @quero_comprar ||= Quero_Comprar::Quero_Comprar.new
    end

  end
  