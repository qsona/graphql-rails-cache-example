class CustomContext < GraphQL::Query::Context
  class Unauthenticated < StandardError; end

  def current_user
    return @current_user if @current_user

    return nil unless self[:authorization]

    @current_user = User.by_authorization(@authorization)
  end

  def current_user!
    raise Unauthenticated unless current_user
    current_user
  end

  def current_user_id
    current_user&.id
  end

  def current_user_id!
    current_user!.id
  end
end

