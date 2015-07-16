class Shop
  @@shops = []

  def initialize(shop_name)
    fail('Shop already exists.') if @@shops.include?(shop_name)

    @@shops.push(shop_name)
    @shop_name = shop_name
    @items = []
  end

  # This method do not allow to add items with the same name

  def add_item(item, quantity = 1)
    return if include_name?(item.name) && !@items.include?(item)

    if @items.include?(item)
      add_quantity(item.name, quantity)
    else
      @items << item
    end
  end

  def include_name?(name)
    @items.any? { |item| item.name == name }
  end

  def add_quantity(name, quantity)
    index = @items.index { |item| item.name == name }
    @items[index].quantity += quantity
  end

  def show_items(by = nil)
    send(:sort_items, by) if by
    @items.each { |item| puts item.to_s }
  end

  def sort_items(by)
    @items.sort! { |item1, item2| item1.send(by) <=> item2.send(by) }
  end

  def show_category(cat)
    @items.each { |item| puts item.to_s if item.category == cat }
  end

  # This method deletes all items if the quantity is not specified

  def delete_item(name, quantity = 0)
    index = @items.index { |item| item.name == name }

    return unless index

    if @items[index].quantity > quantity && quantity != 0
      @items[index].quantity -= quantity
    elsif @items[index].quantity <= quantity || quantity == 0
      @items.delete_at(index)
    end
  end

  def total_cost
    total = @items.inject(0) { |sum, item| sum + item.price * item.quantity }
    puts "Total cost of all items in \"#{@shop_name}\" is: #{total}."
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
