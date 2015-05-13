class Shop
	def initialize(options={})
	  @price  = options[:price]
	  @weight = options[:weight]
	  @name   = options[:name]
	end
	 attr_reader :price, :weight, :name
	 attr_writer :price, :name
end
class Item
	
	attr_reader :items
	
	def initialize
	  @items = Array.new
	end
	
	def add_item(item)
	  @items.push item
	end

	def remove_item(name)
	  @items.each {|i| if i.name == name then @items.delete(i) end}
	end
end

item1 = Shop.new({:price => 9, :weight => 100, :name => "Baton"})
item2 = Shop.new({ :weight => 102, :name => "Bafton"})
it = Item.new
it.add_item item1
it.add_item item2 
it.remove_item("Baton")
p it.items 
