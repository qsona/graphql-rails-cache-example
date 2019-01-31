class Types::ProductType < Types::BaseObject
  extend CacheConfigurable

  type_cache_control 1.hour

  field :id, Int, null: false
  field :name, String, null: false

  field_cache_control :price, 1.minutes
  field :price, Int, null: false
end
