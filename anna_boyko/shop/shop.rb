class Shop
  @@shops = []

  def initialize(shop_name)
    return puts 'Shop already exists.' if @@shops.include?(shop_name)
    @@shops.push(shop_name)
    @shop_name = shop_name
    @items ||= []
  end

  def add_item(item, quantity = 1)
    modified = false
    @items.each do |each_item|
      if each_item.include?(item)
        each_item[1] += quantity
        modified = true
      end
    end
    @items.push([item, quantity]) unless modified
    puts "#{quantity} item(s) \"#{item.name}\" have been successfully added"
  end

  def show_items(by = nil)
    return puts "\"#{@shop_name}\" is empty." if @items.empty?
    sort_items(by) if by
    @items.each do |item|
      puts "Item: #{item[0].name}, price: #{item[0].price}, " \
        "quantity: #{item[1]}, category: #{item[0].category}"
    end
  end

  def sort_items(by)
    case by
    when 'name'
      @items.sort! do |item1, item2|
        item1[0].name.downcase <=> item2[0].name.downcase
      end
    when 'price'
      @items.sort! do |item1, item2|
        item1[0].price <=> item2[0].price
      end
    end
  end

  def show_category(cat)
    items = @items.select do |item|
      item[0].category.downcase == cat.downcase
    end
    items.each do |item|
      puts "Item: #{item[0].name}, price: #{item[0].price}, " \
        "quantity: #{item[1]}, category: #{item[0].category}"
    end
  end

  # This method deletes all items if the quantity is not specified
  def delete_item(name, quantity = 0)
    index = @items.index { |item| item[0].name == name }
    return puts "There's no item \"#{name}" unless index
    if @items[index][1] > quantity && quantity != 0
      @items[index][1] -= quantity
      puts "#{quantity} item(s) \"#{name}\" have been successfully removed"
    elsif @items[index][1] <= quantity || quantity == 0
      @items.delete_at(index)
      puts "Item \"#{name}\" has been removed"
    end
  end

  def total_cost
    if @items.empty?
      puts "\"#{@shop_name}\" is empty."
    else
      total = 0
      @items.each { |each_item| total += each_item[0].price * each_item[1] }
      puts "Total cost of all items in \"#{@shop_name}\" is: #{total}."
    end
  end

  def batch_insert(items)
    items.each do |item, quantity|
      quantity ||= 1
      add_item(item, quantity)
    end
  end

  # This method creates random shop
  def self.create_shop
    random = Random.new
    shop_name = "Shop_#{random.rand(1..20)}"
    shop = Shop.new(shop_name)
    items = []
    random.rand(20).times do
      item_name = "Item_#{random.rand(1..100)}"
      item_cat = "Cat_#{random.rand(1..10)}"
      item_price = random.rand(500..10_000)
      item_quantity = random.rand(1..50)
      item = Item.new(item_name, item_price, item_cat)
      items.push([item, item_quantity])
    end
    shop.batch_insert(items)
    shop
  end
end
