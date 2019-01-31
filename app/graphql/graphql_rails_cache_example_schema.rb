class GraphqlRailsCacheExampleSchema < GraphQL::Schema
  context_class CustomContext
  query_analyzer QueryAnalyzers::CacheControl.new #{ |query, max_age| puts "sss #{max_age}"; query.context.max_age = max_age }
  mutation(Types::MutationType)
  query(Types::QueryType)
end
