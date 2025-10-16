module ApiCommons
  
  def data_load(key)
    data = data_load_from_file(key, DATA_SERVICE)
    return data_handler(data) unless data.nil?

    data = data_load_from_file(key, STANDARD_DATA)

    raise ArgumentError, "Chave: #{key} não encontrada!" if data.nil?

    data_handler(data)
  end
  def load_data_by(root, key, **params)

    data =  ( data_files = params[:data] || { env: binding.eval("API_ENV_DATA_NEW")} 
             return unless root && key

             load_by_key_and_system(root, key, data_files))
             
    format_data(data)
  end

  def api_data_load(keys)
    data = search(keys, API_DATA || {})
    return data unless data.nil?

    search(keys, API_STANDARD_DATA)
  end

  def normalize_key(key)
    replace_special_characteres(key.downcase.tr(' ', '_'))
  end

  def camelize_key(key)
    camelized = normalize_key(key).split('_').collect(&:capitalize).join
    camelized.sub(camelized[0], camelized[0].downcase)
  end

  def remove_caracters_cnpj(key)
    key.delete('./-')
  end

  private

  def search(keys, data)
    keys = keys.split if keys.instance_of? String
    keys.each do |key|
      data = data[key]
      break if data.nil?
    end
    data.deep_dup
  end

  def replace_special_characteres(str)
    return str if str.blank?

    str = str.gsub(/(á|à|ã|â|ä)/, 'a').gsub(/(é|è|ê|ë)/, 'e').gsub(/(í|ì|î|ï)/, 'i').gsub(/(ó|ò|õ|ô|ö)/, 'o').gsub(/(ú|ù|û|ü)/, 'u')
    str = str.gsub(/(Á|À|Ã|Â|Ä)/, 'A').gsub(/(É|È|Ê|Ë)/, 'E').gsub(/(Í|Ì|Î|Ï)/, 'I').gsub(/(Ó|Ò|Õ|Ô|Ö)/, 'O').gsub(/(Ú|Ù|Û|Ü)/, 'U')
    str = str.gsub(/ñ/, 'n').gsub(/Ñ/, 'N')
    str.gsub(/ç/, 'c').gsub(/Ç/, 'C')
  end

  def shuffle_data(data)
    case data
    when ->(x) { [String, Integer, Array, Hash, Symbol].one? { |klazz| x.is_a? klazz } } then send("shuffle_#{data.class.to_s.downcase}", data)
    when ->(x) { x.is_a? NilClass } then nil
    else raise 'O objeto informado não se enquadra para o método shuffle'
    end
  end

  def shuffle_string(data_s)
    if data_s.length.eql?(1)
      data_s.eql?(data_s.upcase) ? Array(('A'..'Z')).sample(1).first : Array(('a'..'z')).sample(1).first
    else
      data_s.chars.shuffle.join
    end
  end

  def shuffle_integer(data_i)
    data_i.to_s.length.eql?(1) ? rand(1..9) : data_i.to_s.chars.shuffle.join.to_f.to_i
  end

  def shuffle_symbol(data_sym)
    data_sym.to_s.chars.shuffle.join.to_sym
  end

  def shuffle_hash(data_h)
    data_h.map { |each_value| shuffle_data(each_value) }.first
  end

  def shuffle_array(data_ar)
    data_ar.shuffle!
    data_ar.map! { |each_value| shuffle_data(each_value) }
    normalize_array_to_hash(data_ar)
  end

  def normalize_array_to_hash(array)
    array.shuffle! while array.last.is_a?(Symbol)
    array.any? { |ar| ar.is_a?(Symbol) } ? array.to_h : array
  end

  def convert_to_mask(number, value)
    value.eql?('sap_id') ? number.tap { |mask| mask[2..5] = '***' } : number.tap { |mask| mask[3..11] = '********' }
  end

  def custom_sort(array)
    array.map { |element| element.chars.first.upcase }.sort_by do |s|
      s =~ /^\d+$/ ? [2, Regexp.last_match(0).to_i] : [1, s]
    end
  end

  def format_data(data)
    my_data = data&.map(&:to_o)
    my_data = my_data.first if my_data.length.eql?(1)
    return my_data
  end

  def load_data_file_by_project(path)
   
    path_without_sandbox = path.split('/').reject { |folder| folder.start_with?('sandbox') }.join('/')
    
    project_name = path_without_sandbox.split('/').grep(/^testes-/).last.gsub('testes-', '').gsub('-', '_').upcase

    return { env: API_ENV_DATA_NEW } if project_name.eql?('API')

    { env: binding.eval("#{project_name}_ENV_DATA"), standard: binding.eval("#{project_name}_STANDARD_DATA") } # { env: STORE_ENV_DATA, standard: STORE_STANDARD_DATA }
  end

  def load_by_key_and_system(root, key, data_files)
    profiles = key.split if key.instance_of? String
    data = match_objects_by_profile_and_system(data_files[:env][root], profiles)
    return data unless data.empty?

    match_objects_by_profile_and_system(data_files[:standard][root], profiles)
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

  def data_load_from_file(key, data)
    key = key.split if key.instance_of? String
    key.each do |item|
      data = data[item]
      break if data.nil?
    end
    data
  end

  def data_handler(data)
    data.instance_of?(Hash) ? OpenStruct.new(data) : data
  end

end
