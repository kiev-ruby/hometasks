require_relative 'shop.rb'
require_relative 'items.rb'


shop = Shop.new("Computer items")

15.times do
    item = Items.new("item#{ rand(100) }", rand(100), rand(15))
    shop.add_item(item)
end

shop.info
shop.show_items
shop.sort_by_price
