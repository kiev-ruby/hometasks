class Shop
  def initialize(options={})
    @price = options[:price]
    @name = options[:name]
  end

  attr_accessor :price, :name

end

class Item
	
  attr_reader :items
	
  def initialize
    @items = Array.new
  end
	
  def add_item(item)
    @items.push item
  end
	
  def batch_add *item
    @items += items
  end
	
  def remove_item(name)
    @items.each { |i| if i.name == name then @items.delete(i) end }
  end

  def remove_same_item (name, number)
    remove_item = @items.find{ |item| item.name == name }
    remove_item.quantity -= number
  end
  
  def items_by_cat cat
    @items.find_all{ |item| item.category == cat }
  end

  def total_cost
    @items.inject(0){ |sum, item| sum + item.price }
  end

end


