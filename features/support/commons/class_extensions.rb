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
