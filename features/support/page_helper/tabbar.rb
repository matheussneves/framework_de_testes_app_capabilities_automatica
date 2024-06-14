Dir[File.join("#{Dir.pwd}/features", 'page_objects/*_page.rb')].map { |file| require file }

module PageObjects
    def tabbar
      @tabbar ||= TabBar::TabBar.new
    end

  end
  