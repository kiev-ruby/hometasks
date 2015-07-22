require_relative 'shop'
require_relative 'computer_item'

# item1 = ComputerItem.new("samsung",20.45,"monitor")
# item2 = ComputerItem.new("asusVS",100,"laptop")
# item3 = ComputerItem.new("lenovo",150,"laptop")
# shop1 = Shop.new("myshop")

# package1 = shop1.package(5,item1)           # Number of the same goods
# package2 = shop1.package(3,item2)           # can be set using 'package' method

# shop1.add_items(package1,package2,item3)    # If you want to add set of items then use package.

# shop1.show_items                            # To see what is already in the store
#                                             # Products are sorted by price
# shop1.delete_item("lenovo",2)
# shop1.show_items

# shop1.total_cost
# shop1.select_goods("laptop")                # Selecting goods by category
# shop = Shop.random_shop(5)                  # Creating random shop with random items
#                                             # The quantity of goods is specified in brackets
# shop.show_items
