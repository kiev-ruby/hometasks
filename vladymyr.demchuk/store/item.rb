# class Item
class Item
  attr_accessor :name, :price, :quantity, :category

  def initialize(name, price, quantity, category)
    fail 'You cant create item with the name less than 5 letters!' if name.length < 5
    @name = name
    @price = price
    @quantity = quantity
    @category = category
  end

  def to_s
    puts "Item: #{@name}, Price: #{@price}, Quantity: #{@quantity}, Category: #{category}"
  end
end
