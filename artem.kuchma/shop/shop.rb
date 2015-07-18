class Shop
	attr_accessor :name, :items

	def initialize(shop_name = "My shop", items = [])
		@shop_name = shop_name
		@items = items
	end

	@@shop_category = ["cat-1", "cat-2", "cat-3"]

	def print_shop_name
		"The name of your store: #{@shop_name}"
	end




	def add_category(category)
		
		if @@shop_category.count {|shop_category| shop_category == category } == 1
			puts "This category alreadi exist"
		else
			@@shop_category << category
		end
	end

	def list_all_categorys
		puts "Shop categorys:"
		@@shop_category.each {|shop_category| puts "#{shop_category}  " }
		
	end

# Function of generation test content. n - number of items
	def content_creator(n)
		@n = @@shop_category.size		
		n.to_i.times do |item|
			item += 1
			item = Item.new("Comp_item_#{item}", "#{@@shop_category[rand(0..@n-1)]}", rand(1000), rand(5) )
			@items.push(item)			
		end
	end













	def add_item(name, category, price, quantity)		
		item = Item.new(name, category, price, quantity)
		if name.size < 5
			puts "The name should contain more than 5 symbols"
		elsif @items.count{|item| item.name == name} == 1
			puts "This item alreadi exists!"
		elsif @@shop_category.count {|shop_category| shop_category == category} == 0
			puts "\'#{category}\' category does not exist"

		else				
			@items << item
			#@items.each {|item| puts "#{item.name}, #{price}, #{quantity}"}
		end
	end

	def list_all_items
		@items.each do |item|
			puts item.to_s
		end
	end

	def delete_by_name(name)
		if @items.reject! {|item| item.name == name}
			puts "Item #{name} deleted!"
		else
			puts "Item not found. "
		end
	end

	def total_cost
		@total = 0
		@items.each do |item|
			@total += item.price * item.quantity
		end
		puts "Total cost of all items: #{@total}"
	end

	def remove_same_items(name, quantity_remove)
		if @items.count{|item| item.name == name} == 0
			puts "Item \'#{name}\' does not exist" 
		else
			@items.each do|item|			
				if item.name == name  && item.quantity >= quantity_remove 
					item.quantity -=  quantity_remove
				elsif item.name == name  && item.quantity <= quantity_remove
					puts "Items #{name} less than #{quantity_remove}"							
				end				
			 end
		end
	end

	def sort_by_category(category)
		i = items.select {|item| item.category == category}
		i.each {|item| puts item.to_s}
		puts "In \'#{category}\' category items is absent" if i.empty? 
	end

end

shop = Shop.new
	#puts shop.print_shop_name
	
	
	
	#shop.delete_by_name("tes")
	#
	#shop.total_cost
	#shop.remove_same_items("testt", 3)
	#shop.list_all_items
	shop.add_category("test")
	shop.list_all_categorys
shop.content_creator(5)
#shop.list_all_items
shop.add_item("testt", "cat-1", 23, 4)
shop.list_all_items
puts " "
shop.sort_by_category("test")