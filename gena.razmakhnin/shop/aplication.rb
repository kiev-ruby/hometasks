require './shop'
require './item'

def generate_shop
  bot = Shop.new 'name'
  20.times do |index|
    bot.add Item.new(random_name, rand(100), rand(100), random_category)
  end
end

def random_name
  ('a'..'z').to_a.shuffle.take(10).join
end

def random_category
  ('a'..'d').to_a.shuffle.take(1)[0]
end
