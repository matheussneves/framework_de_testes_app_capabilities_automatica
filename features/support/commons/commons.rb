module ApiCommons
   def convert_object_to_hash(object)
    return unless object

    hash = {}
    object.instance_variables.each do |var|
      hash[var.to_s.delete('@')] = object.instance_variable_get(var)
    end

    hash
  end
end
