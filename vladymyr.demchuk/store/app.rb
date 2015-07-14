require_relative 'store.rb'
require_relative 'item.rb'

puts '----------New running--------------'

def create_store
  store = Store.new(random_name(10))

  5.times { store.add_items(Item.new(random_name(5), 1 + rand(99), 1 + rand(499), random_name(5))) }

  store
end

def random_name(n)
  [*('a'..'z')].sample(n).join.capitalize
end

store = create_store
store.show_items
puts "Total: #{store.total_cost}"
