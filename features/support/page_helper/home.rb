
puts ()

Dir[File.join("#{Dir.pwd}/features", 'page_objects/*_page.rb')].map { |file| require file }

module PageObjects
    def home
      @home ||= Home::Home.new
    end

  end
  