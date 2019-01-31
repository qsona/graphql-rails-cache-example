module QueryAnalyzers
  class CacheControl
    def analyze?(query)
      true
    end

    def initial_value(query)
      {
        ages: [],
        query: query,
      }
    end

    def call(memo, visit_type, irep_node)
      return memo unless visit_type == :enter

      return memo if irep_node&.definition&.metadata.nil?

      type_class = irep_node.definition.metadata[:type_class]

      owner_type = type_class.owner
      if owner_type.respond_to?(:field_max_age)
        memo[:ages] << {
          place: type_class.method_sym,
          value: owner_type.field_max_age(type_class.method_sym)
        }
      end

      memo
    end

    def final_value(memo)
      puts memo[:ages]
      memo[:query].context.max_age = memo[:ages].map { |a| a[:value] }.min || 0
    end
  end
end
