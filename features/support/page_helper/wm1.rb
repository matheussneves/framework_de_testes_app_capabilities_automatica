Dir[File.join("#{Dir.pwd}/features", 'page_objects/*_page.rb')].map { |file| require file }

module PageObjects
    def wm1
      @wm1 ||= WM1::WM1.new
    end

  end
  