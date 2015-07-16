class Shop
	attr_accessor :name, :items

	def initialize(shop_name="My shop", items = [])
		@shop_name = shop_name
		@items = items
	end

	def print_shop_name
		"The name of your store: #{@shop_name}"
	end

# Function of generation test content. n - number of items
	def content_creator(n)		
		n.to_i.times do |item|
			item += 1
			item = Item.new("Comp_item_#{item}", "cat", rand(1000), rand(5) )
			@items.push(item)			
		end
	end

	def add_item(name, category, price, quantity)		
		item = Item.new(name, category, price, quantity)
		items.each{|item|  @x = 1 if item.name == name}
		if name.size <5
			puts "The name should contain more than 5 symbols"
		elsif @x == 1
			puts "This item alreadi exists!"
		else				
			@items << item
			#@items.each {|item| puts "#{item.name}, #{price}, #{quantity}"}
		end
	end

	def list_all_items
		items.each do |item|
			puts item.to_s
		end
	end

	def delete_by_name(name)
		if items.reject! {|item| item.name == name}
			puts "Item #{name} deleted!"
		else
			puts "Item not found. "
		end
	end



end

shop = Shop.new
	#puts shop.print_shop_name
	shop.content_creator(5)
	shop.add_item("Comp_item_10", "cat", 23, 5)
	shop.list_all_items
	#shop.delete_by_name("tes")
	#shop.list_all_items

