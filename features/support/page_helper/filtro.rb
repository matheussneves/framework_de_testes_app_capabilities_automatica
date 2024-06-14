Dir[File.join("#{Dir.pwd}/features", 'page_objects/*_page.rb')].map { |file| require file }

module PageObjects
    def filtro
      @filtro ||= Filtro::Filtro.new
    end

end
  