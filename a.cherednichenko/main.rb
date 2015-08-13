require_relative 'item.rb'
require_relative 'store.rb'

puts '----CREATING STORES WITH ITEMS----'

ITEMS_NUM = 10
store = Store.new('Good store')

ITEMS_NUM.times do |i|
  item = Item.new(
    "item#{i + 1}",
    "Category#{rand(50)}",
    rand(100),
    rand(20) + 1)
  store.add_item(item)
end

store.show_all_items
