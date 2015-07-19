class Shop
  attr_accessor :name, :items

  def initialize(name)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def add_quantity(name, quantity = 1)
    @items.find { |item| item.name == name }.quantity += quantity
  end

  def show_items(by = nil)
    @items.sort! { |item1, item2| item1.send(by) <=> item2.send(by) } if by
    @items.each { |item| puts item.to_s }
  end

  def show_category(cat)
    @items.each { |item| puts item.to_s if item.category == cat }
  end

  def remove_item(name)
    @items.delete(@items.find { |item| item.name == name })
  end

  def delete_item(name, quantity = 1)
    @items.find { |item| item.name == name }.quantity -= quantity
  end

  def total_cost
    total = @items.inject(0) { |sum, item| sum + item.price * item.quantity }
    puts "Total cost of all items in \"#{@name}\" is: #{total}."
  end

  def batch_insert(items)
    items.each { |item| add_item(item) }
  end

  def self.create_shop
    random = Random.new

    shop_name = "Shop_#{random.rand(1..20)}"
    shop = Shop.new(shop_name)

    items = create_items
    shop.batch_insert(items)

    shop
  end

  def self.create_items
    random = Random.new

    items = []

    10.times do
      item_name = "Item_#{random.rand(1..100)}"
      item_cat = "Cat_#{random.rand(1..10)}"
      item_price = random.rand(500..10_000)
      item_quantity = random.rand(1..50)
      item = Item.new(item_name, item_price, item_quantity, item_cat)
      items << item
    end

    items
  end
end
