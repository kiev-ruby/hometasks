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

  def show_items(arg=:price)
    if arg == :price || arg == :name
      @shop.sort_by(&arg).each do |i|
        puts "Item: #{i.name} with price #{i.price} and category #{i.category}"
      end
    end
  end

  def select_goods(category)
    @shop.select { |i| i.category.eql? category }
  end

  def delete_item(item_name, num)
    num.times do
      if i = @shop.index{|i| i.name.eql? item_name}
        @shop.delete_at(i)
      else
        return puts "No such item"
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
