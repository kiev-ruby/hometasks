class Shop
  @@shops = []

  def initialize(shop_name)
    return puts 'Shop already exists.' if @@shops.include?(shop_name)

    @@shops.push(shop_name)
    @shop_name = shop_name
    @items = []
  end

  def add_item(item, quantity = 1)
    index = @items.index { |shop_item| shop_item[0].name == item.name }
    if index
      @items[index][1] += quantity
    else
      @items.push([item, quantity])
    end
    puts "#{quantity} item(s) \"#{item.name}\" have been successfully added"
  end

  def show_items(by = nil)
    sorted = by ? send(:sort_items, by) : @items
    sorted.each do |item|
      puts item[0].to_s << " - quantity: #{item[1]}"
    end
  end

  def sort_items(by)
    case by
    when 'name'
      return @items.sort do |item1, item2|
        item1[0].name.downcase <=> item2[0].name.downcase
      end
    when 'price'
      return @items.sort do |item1, item2|
        item1[0].price <=> item2[0].price
      end
    end
  end

  def show_category(cat)
    items = @items.select do |item|
      item[0].category == cat
    end
    items.each do |item|
      puts item[0].to_s << " - quantity: #{item[1]}"
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
    total = @items.inject(0) { |sum, item| sum + item[0].price * item[1] }
    puts "Total cost of all items in \"#{@shop_name}\" is: #{total}."
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
