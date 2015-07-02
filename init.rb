require_relative "item"


@items=ComputerItems.new

@items.add_items(ComputerItems.new)
@items.add_items(ComputerItems.new)
p @items
@items.delete_items
p @items