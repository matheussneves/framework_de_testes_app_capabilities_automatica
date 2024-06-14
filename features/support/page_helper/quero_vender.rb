Dir[File.join("#{Dir.pwd}/features", 'page_objects/*_page.rb')].map { |file| require file }

module PageObjects
  def quero_vender
    @quero_vender ||= Quero_Vender::Quero_Vender.new
  end
end
  