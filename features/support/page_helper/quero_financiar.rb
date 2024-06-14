Dir[File.join("#{Dir.pwd}/features", 'page_objects/*_page.rb')].map { |file| require file }

module PageObjects
  def quero_financiar
    @quero_financiar ||= Quero_financiar::Quero_financiar.new
  end
end
  