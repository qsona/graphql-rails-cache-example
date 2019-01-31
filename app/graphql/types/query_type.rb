module Types
  class QueryType < Types::BaseObject
    extend CacheConfigurable

    type_cache_control 1.day

    field_no_cache :me
    field :me, UserType, null: false, description: 'myself'

    field_cache_control :user, 30.minutes
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
