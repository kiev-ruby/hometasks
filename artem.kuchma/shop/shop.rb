class Shop
	attr_accessor :name, :items

	def initialize(name, items = [])
		@name = name
		@items = items
	end