  class Object
    def duplicable?
      true
    end
  
    def deep_dup
      duplicable? ? dup : self
    end
  end
  
  class Array
    def deep_dup
      map(&:deep_dup)
    end
  end
  
  class Hash
    def deep_dup
      hash = dup
      each_pair do |key, value|
        if key.frozen? && key.is_a?(String)
          hash[key] = value.deep_dup
        else
          hash.delete(key)
          hash[key.deep_dup] = value.deep_dup
        end
      end
      hash
    end
  
    def to_o
      JSON.parse to_json, object_class: OpenStruct
    end
  end
 
  def carregar_massa(root, key, **params)

    data =  ( data_files = params[:data] || { env: binding.eval("APP_ENV_DATA"), standard: binding.eval("APP_STANDARD_DATA") } 
             return unless root && key
            
             load_by_key_and_system(root, key, data_files))
             
    format_data(data)
  end
  private

  def load_by_key_and_system(root, key, data_files)
    profiles = key.split if key.instance_of? String
    data = match_objects_by_profile_and_system(data_files[:env][root], profiles)
    return data unless data.empty?

    match_objects_by_profile_and_system(data_files[:standard][root], profiles)
  end

  def format_data(data)
    my_data = data&.map(&:to_o)
    my_data = my_data.first if my_data.length.eql?(1)
    return my_data
  end

  def match_objects_by_profile_and_system(data_list, profiles)
    data = []
    data_list&.map do |object|
      matched_profiles = 0
      profiles&.map do |profile|
        matched_profiles += 1 if object['profiles'].include?(profile)
      end
      data << object.deep_dup if profiles.size.eql?(matched_profiles)
    end
    data
  end

