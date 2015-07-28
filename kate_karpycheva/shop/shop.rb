require_relative 'computer_item'

class Shop
  def initialize(name)
    @name = name
    @items = []
  end

  def self.random_shop(n)
    shop = Shop.new(random_string)
    shop.add_items(Array.new(n) { ComputerItem.new(random_string, rand(10..10_000), random_string, rand(1..5)) })
    return shop
  end

  def add_items(*items)
    items.flatten!.each { |elm| @items << elm }
  end

  def set_quantity(num, item)
    @items.each { |i| i.quantity = num if i.name == item.name }
  end

  def show_items(arg = :price)
    if arg == :price || arg == :name
      @items.sort_by(&arg).each do |i|
        puts "#{i.quantity} #{i.name} with "\
              "price #{i.price} and category #{i.category}"
      end
    end
  end

  def select_goods(category)
    @items.select { |i| i.category == category }
  end

  def delete_item(item_name, num)
    item = @items.find { |i| i.name == item_name }
    @items.delete(item) if (item.quantity -= num) <= 0
  end

  def total_cost
    @items.inject(0) { |a, e| a + e.price * e.quantity }
  end

  def self.random_string
    Array.new(rand(6..10)) { [*'a'..'z'].sample }.join.capitalize
  end
end
