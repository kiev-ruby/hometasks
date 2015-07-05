require_relative 'store.rb'
require_relative 'item.rb'

puts '----------New running--------------'

=begin
store = Store.new("Computer Items")

items = []
items << Item.new("Keyboard", 20, 4, "periphery") << Item.new("Mouse", 10, 2, "periphery") << Item.new("Proccessor", 100, 5, "main") << Item.new("Monitor", 200, 3, "display") << Item.new("Mother Board", 100, 5, "main")

items.each { |item| store.add_item(item) }

store.show_items

puts "--- Order by price ---"
store.order_by_price
store.show_items

puts "--- Order by name ---"
store.order_by_name
store.show_items

puts "--- Show Category ---\n "
store.show_category("periphery").to_s

store.set_quantity("Mouse", 15)
store.delete_item("Keyboard")
store.remove_quantity("Monitor", 1)

store.show_items

puts store.total_cost

item1 = Item.new("Sound Card", 5, 20, "main")
item2 = Item.new("Random Access Memory", 40, 18, "main")
item3 = Item.new("Hard Disk Drive", 120, 7, "main")

store.add_items(item1, item2, item3)

store.show_items
=end

def create_store
  store2 = Store.new(random_name(10))

  10.times { store2.add_item(Item.new(random_name(10), 1 + rand(99), 1 + rand(499), random_name(5))) }

  store2.show_items
end

def random_name(n)
  [*('a'..'z')].sample(n).join.capitalize
end

create_store
