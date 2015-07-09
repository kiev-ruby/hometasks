class Item
  attr_accessor :name, :price, :category

  def initialize(name, price, category)
    return puts 'The name of item is too short' if name.size < 5
    @name = name
    @price = price
    @category = category
  end
end
