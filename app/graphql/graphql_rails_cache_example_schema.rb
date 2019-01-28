class GraphqlRailsCacheExampleSchema < GraphQL::Schema
  context_class CustomContext
  mutation(Types::MutationType)
  query(Types::QueryType)
end
