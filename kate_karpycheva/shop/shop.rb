require_relative 'computer_item'

class Shop
  def initialize(name)
    @name = name
    @shop = []
  end

  def self.random_shop(n)
    shop = Shop.new(random)
    shop.add_items(Array.new(n) { ComputerItem.new(random, rand(10..10_000), random) })
    return shop
  end

  def add_items(*items)
    items.flatten!
    items.each do |elm|
      if elm.class == ComputerItem
        @shop << elm unless elm.name.nil?
      elsif elm.class == Hash
        elm.each { |k, v| k.times.each { @shop << v } }
      end
    end
  end

  def package(num, item)
    { num => item } unless item.name.nil?
  end

  def show_items
    @shop.sort_by(&:price).each do |i|
      puts "Item: #{i.name} with price #{i.price} and category #{i.category}"
    end
  end

  def select_goods(category)
    puts 'Goods with such category: '
    @shop.uniq.each do |item|
      puts "Item: #{item.name} with price #{item.price}" if item.category == category
    end
  end

  def delete_item(item_name, num)
    num.times do
      for j in 0...@shop.length
        if  @shop[j].name == item_name
          @shop.delete_at(j)
          break
        end
      end
    end
  end

  def total_cost
    puts "Total cost: #{@shop.inject(0) { |a, e| a + e.price }}"
  end

  def self.random
    Array.new(rand(6..10)) { [*'a'..'z'].sample }.join.capitalize
  end
end
