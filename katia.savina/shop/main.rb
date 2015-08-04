require_relative 'item.rb'
require_relative 'shop.rb'

def randomize
  chars = 'abcdefghjkmnpqrstuvwxyz'
  name = ''
  7.times { name << chars.split('').sample }
  rand_shop = Shop.new(name.capitalize)

  5.times do
    item_name = ''
    category = ''
    7.times { item_name << chars.split('').sample }
    7.times { category << chars.split('').sample }
    rand_shop.add_items(Item.new(item_name, rand(100), rand(50), category))
  end
  rand_shop
end

random_shop = randomize
random_shop.display_goods(:name, :desc)

# test
shop = Shop.new('my_shop')

item0 = Item.new('mouse', 15, 3)
shop.add_items(item0)
item1 = Item.new('screen', 25, 2, 'Peripherals')
shop.add_items(item1)
item2 = Item.new('screen', 15, 3)
shop.add_items(item2)

shop.display_goods
shop.display_total

item3 = Item.new('keyboard', 20, 3, 'Peripherals')
item4 = Item.new('SDcard', 25, 6, 'Memory')
item5 = Item.new('flash', 10, 10, 'Memory')
item6 = Item.new('keyboard', 10, 10, 'Peripherals')
items = [item3, item4, item5, item6]

shop.add_items *items
shop.delete('SDcard')
shop.set_number('keyboard', 29)
shop.display_goods(:price)
shop.display_total

shop.select_goods('Peripherals')
