class User
  def self.by_authorization(authorization)
    # Temporary Code
    new(1)
  end

  def initialize(id)
    @id = id
  end

  attr_reader :id

  def name; "my_name_#{id}"; end

  def bought_products
    [Product.find(3)]
  end
end
