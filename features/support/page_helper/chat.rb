Dir[File.join("#{Dir.pwd}/features", 'page_objects/*_page.rb')].map { |file| require file }

module PageObjects
    def chat
      @chat ||= Chat::Chat.new
    end

  end
  