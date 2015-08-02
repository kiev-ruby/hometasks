require_relative 'computer_item'
require_relative 'shop'

item1 = ComputerItem.new("samsung",101.45,"monitor")
item2 = ComputerItem.new("asusVS",100,"laptop",2)
item3 = ComputerItem.new("lenovo",50,"laptop",2)
shop1 = Shop.new("myshop")

shop1.add_items(item1,item2,item3)
shop1.set_quantity(10,"lenovo")

shop1.show_items(:name)
shop1.remove_number("asusVS",1)
shop1.delete_item("lenovo")
shop1.show_items(:name)

p shop1.total_cost
shop1.select_goods("laptop")
shop = Shop.random_shop(3)

shop.show_items
