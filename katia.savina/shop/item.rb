class Item
  attr_accessor :name, :price, :number, :category

  def initialize(name, price, number = 1, category = 'Misc')
    fail 'ERROR: Too short name.' if name.size < 5
    @name = name
    @price = price
    @number = number
    @category = category
  end
end
