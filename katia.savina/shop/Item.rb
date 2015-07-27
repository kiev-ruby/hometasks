class Item
  attr_accessor :name, :price, :number, :category

  def initialize(name, price, number=1, category="Misc")
  	if name.size > 4
  	  @name = name
  	  @price = price
  	  @number = number
  	  @category = category
  	else
  	  puts "ERROR: Too short name. An item hasn't been created"
  	end
  end
end