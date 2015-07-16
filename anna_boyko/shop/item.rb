class Item
  attr_accessor :name, :price, :quantity, :category

  def initialize(name, price, quantity, category)
    fail('The name of item is too short') if name.size < 5
    @name = name
    @price = price
    @quantity = quantity
    @category = category
  end

  def to_s
    "Item: #{@name}, price: #{@price}, " \
    "quantity: #{@quantity}, category: #{@category}"
  end
end
