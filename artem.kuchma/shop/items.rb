class Item
	attr_accessor :name, :category, :price, :quantity

	def initialize(name, category, price, quantity)
		@name = name
		@category = category
		@price = price
		@quantity = quantity
	end

	def to_s
		"Name: #{@name}; Category: #{@category}; Price: #{@price}; Quantity: #{quantity};"
	end
end	


