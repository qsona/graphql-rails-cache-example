module Types
  class QueryType < Types::BaseObject
    field :me, UserType, null: false, description: 'myself'
    field :user, UserType, null: false, description: 'user' do
      argument :id, Int, required: true
    end
    field :products, [ProductType], null: false

    def me
      context.current_user!
    end

    def user(id:)
      User.new(id)
    end

    def products
      Product.all
    end

  end
end
