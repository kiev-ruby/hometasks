# class item
class Item
  attr_accessor :item, :price, :quantity, :category

  def initialize(item, price, quantity = 1, category)
    @item = item
    raise 'items must be < 5 letters size!' if item.size < 5
    @price = price
    @quantity = quantity
    @category = category
  end

  def to_s
    "Item:#{item}, category:#{category}, price:#{price}$, quantity:#{quantity}"
  end
end
