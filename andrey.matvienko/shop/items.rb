class Items
  attr_accessor :item, :price, :quantity, :category

  def initialize item, price, category, quantity = 1
    item.size < 5 ? (raise "items must be <=5 letters size") : @item = item
    @price = price
    @quantity = quantity
    @category = category
  end

  def to_s
    "Item: #{ item }, category: #{ category }, price: #{ price }$ , quantity: #{ quantity }"
  end
end
