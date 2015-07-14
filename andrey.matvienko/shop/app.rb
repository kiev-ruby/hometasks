require_relative 'shop.rb'
require_relative 'item.rb'

shop = Shop.new('Computer items')

5.times do
  item = Item.new("item #{rand(10)}", rand(100), rand(15))
  shop.add_item(item)
end

shop.info
shop.show_items
shop.sort_by_price
