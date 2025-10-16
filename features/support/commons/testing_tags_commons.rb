module ApiCommons
  attr_accessor :endpoint_name, :responsable_name

  def initialize_testing_tags(scenario)
    scenario.tags.each do |tag|
      case tag.name
      when /.*_.*\..*/ then @endpoint_name = tag.name.delete '@' unless ENV.fetch('BROWSER', nil) || ENV.fetch('SO', nil)
      when /@#/ then @responsable_name = tag.name[2..]
      end
    end
  end
end
