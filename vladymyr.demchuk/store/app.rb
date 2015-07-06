require_relative 'store.rb'
require_relative 'item.rb'

puts '----------New running--------------'

def create_store
  store = Store.new(random_name(10))

  5.times { store.add_item(Item.new(random_name(5), 1 + rand(99), 1 + rand(499), random_name(5))) }

  store
end

def random_name(n)
  [*('a'..'z')].sample(n).join.capitalize
end

store = create_store
# store.show_items

store2 = create_store
# store2.show_items

stores = [store, store2]

puts 'Welcome to app'
puts 'Enter appropriate number to choose, please'

puts '1: to work with existed stores'
puts '2: create new store'
puts '-1: to exit'
choice = gets.chomp
choice = choice.to_i
case choice
when 1
  puts 'Choose store to operate'
  # stores.each { |store| puts store.name }
  stores.each_index { |index| puts "#{index + 1}: #{stores[index].name}" }
  store_choice = gets.chomp
  store_choice = stores[store_choice.to_i - 1]

  # store_choice.show_items

  puts 'Choose operation'
  puts '1: show item'
  puts '2: add item'
  puts '3: delete item by name'
  puts '4: see total cost of item'
  puts '5: change quantity of item'
  puts '6: reduce quantity of item'
  puts '7: see some category of items'
  puts '8: see items ordered by price'
  puts '9: see items ordered by price'

  operation_choice = gets.chomp
  operation_choice = operation_choice.to_i

  case operation_choice
  when 1
    store_choice.show_items
  when 2
    store_choice.add_item(Item.new(random_name(8), 1 + rand(99), 1 + rand(499), random_name(5)))
    store_choice.show_items
  when 3
    puts 'Enter name'
    name = gets.chomp
    store_choice.delete_item(name)
  when 4
    puts "Total cost is #{store_choice.total_cost}$"
  when 5
    puts 'Enter item name'
    name = gets.chomp
    puts 'Enter new quantity'
    quantity = gets.chomp
    store_choice.set_quantity(name, quantity)
  when 6
    store_choice.show_items
    puts 'Enter item name'
    name = gets.chomp
    puts 'Enter quantity to reduce'
    quantity = gets.chomp
    store_choice.remove_quantity(name, quantity)
    store_choice.show_items
  end

when 2
  stores.push(create_store)
when -1
end
