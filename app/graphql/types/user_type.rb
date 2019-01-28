class Types::UserType < Types::BaseObject
  field :id, Int, null: false
  field :name, String, null: false
  field :bought_products, [ProductType], null: false
end
