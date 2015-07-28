class ComputerItem
  attr_accessor :name, :price, :category, :quantity
  def initialize(name, price, category, quantity = 1)
    if name.length < 5
      fail ArgumentError, "Name of item #{name} is less than 5 symbols"
    end
    @name = name
    @price = price
    @category = category
    @quantity = quantity
  end
end
