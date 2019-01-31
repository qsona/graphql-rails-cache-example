module CacheConfigurable
  def field_cache_control(field_name, max_age)
    @field_max_age_hash ||= {}
    @field_max_age_hash[field_name.to_s] = max_age
  end

  def type_cache_control(max_age)
    @type_max_age = max_age
  end

  def field_no_cache(field_name)
    field_cache_control(field_name, 0)
  end

  def type_no_cache
    type_cache_control(0)
  end

  def field_max_age(field_name)
    @field_max_age_hash ||= {}
    @field_max_age_hash[field_name.to_s] || type_max_age
  end

  def type_max_age
    @type_max_age || 0
  end
end
