class Types::UserType < Types::BaseObject
  extend CacheConfigurable

  type_cache_control 30.minutes

  field :id, Int, null: false
  field :name, String, null: false

  field_cache_control :bought_products, 5.minutes
  field :bought_products, [ProductType], null: false
end
