class ComputerItem
  attr_accessor :name, :price, :category, :quantity

  def initialize(name, price, category, quantity = 1)
    fail ArgumentError, "Name of item #{name} is less than 5 symbols" if name.length < 5
    @name = name
    @price = price
    @category = category
    @quantity = quantity
  end

  def to_s
    "#{@quantity} #{@name} with price #{@price} and category #{@category}"
  end

end
