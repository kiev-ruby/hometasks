require './shop'
require './item'

	def gen
		bot = Shop.new 'name'
		20.times do |index|
			bot.add Item.new(('a'..'z').to_a.shuffle.take(10).join, 
								rand(100), rand(100), ('a'..'d').to_a.shuffle.take(1)[0])
		end
		return bot
	end
