class Item
  attr_accessor :name, :price, :category

  def initialize(name, price, category)
    fail('The name of item is too short') if name.size < 5
    @name = name
    @price = price
    @category = category
  end

  def to_s
    "Item: #{@name}, price: #{@price}, category: #{@category}"
  end
end
