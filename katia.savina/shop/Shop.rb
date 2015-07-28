require_relative 'item.rb'

class Shop
  attr_reader :total_cost, :name

  def initialize(name)
    @name = name
    @goods = []
    @total_cost = 0
  end

  def add_item(item)
    index = @goods.index { |i| i.name == item.name }
    if index.nil?
      @goods.push(item)
    else
      @goods[index].number += item.number
    end
    @total_cost += item.price * item.number
  end

  def delete(name, number = nil)
    to_delete = @goods.find { |item| item.name == name }
    if number.nil?
      @goods.delete_if { |item| item.name == name }
      @total_cost -= to_delete.price
    else
      index = @goods.index { |i| i.name == name }
      @goods[index].number -= number
      @total_cost -= @goods[index].price
    end
  end

  def display_goods
    puts "\nGoods list "
    @goods.each do |i|
      puts "#{i.name} \$#{i.price} #{i.number} pieces #{i.category}"
    end
  end

  def display_total
    puts "\nTotal: #{@total_cost}"
  end

  def select_goods(category)
    selection = @goods.select { |item| item.category == category }
    selection.each do |item|
      puts "#{item. name}  \$#{item.price}  #{item.number}"
    end
  end

  def add_many(items)
    items.each do |item|
      index = @goods.index { |i| i.name == item.name }
      if index.nil?
        @goods.push(item) if item.is_a? Item
        puts item.to_s
      else
        @goods[index].number += item.number
      end
      @total_cost += item.price * item.number
    end
  end

  def order_by_name(name)
    @goods.select { |item| item.name == name }
  end

  def order_by_price(price)
    @goods.select { |item| item.price == price }
  end
end
