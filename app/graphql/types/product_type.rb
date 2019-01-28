class Types::ProductType < Types::BaseObject
  field :id, Int, null: false
  field :name, String, null: false
  field :price, Int, null: false
end
