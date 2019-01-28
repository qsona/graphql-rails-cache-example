class Product
  LIST = [
    { id: 1, name: '十四代 純米大吟醸 龍泉', price: 400000 },
    { id: 2, name: 'Romanée-conti', price: 2100000 },
    { id: 3, name: '特茶', price: 170 },
  ].freeze

  def initialize(hash)
    @id = hash[:id]
    @name = hash[:name]
    @price = hash[:price]
  end

  attr_reader :id, :name, :price

  def self.find(id)
    pr = LIST.find { |l| l[:id] == id }
    puts pr
    pr && new(pr)
  end

  def self.all
    LIST.map { |l| new(l) }
  end
end
