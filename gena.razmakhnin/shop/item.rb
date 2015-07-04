class Item
  attr_accessor :name, :price, :quantity, :category

  def initialize(name, price, quantity = 1, category)
    raise 'name of item is less then 5 letters' if name.size > 5
    @name = name
    @price = price
    @quantity = quantity
    @category = category
  end

  def to_s
    "#{name} - #{price} - #{quantity} - #{category}"
  end
end
