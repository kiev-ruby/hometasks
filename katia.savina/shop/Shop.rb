$LOAD_PATH << '.'
require 'Item.rb'

class Shop 
  attr_reader :total_cost, :name

  def initialize(name)
      @name = name
      @goods = []
      @total_cost = 0
  end

  def add_item(item)
  	unless item.name.nil?
  	  index = @goods.index {|i| i.name == item.name}
      unless index.nil? 
        @goods[index].number += item.number
      else
        @goods.push(item)
      end
      @total_cost += item.price * item.number
    end
  end

  def delete(name, number=nil)
    to_delete = @goods.select {|item| item.name==name}
    unless to_delete[0].nil? 
      if number.nil?
        puts "\n#{to_delete[0].name} deleted"
        @goods.delete_if {|item| item.name==name}
        @total_cost -= to_delete[0].price
      else
        puts "\n#{number} pieces of #{to_delete[0].name} deleted"
        index = @goods.index {|i| i.name == name}
        @goods[index].number -= number
        @total_cost -= @goods[index].price
      end
    end
  end

  def display_goods
  	puts "\nGoods list "
    @goods.each do |i|
      puts "#{i.name} \$#{i.price} #{i.number} pieces #{i.category}"
    end
  end

  def get_total
    puts "\nTotal: #{@total_cost}"
  end

  def select_goods(category)
    selection = @goods.select {|item| item.category == category}
    selection.each do |item|
      puts "#{item.name}  \$#{item.price}  #{item.number}"
    end
    return selection
  end

  def add_many items
  	puts items.size
  	items.each do |item|
     index = @goods.index {|i| i.name == item.name}
     unless index.nil? 
        @goods[index].number += item.number
      else
        @goods.push(item) if item.is_a? Item
        puts item.to_s
      end
      @total_cost += item.price * item.number
    end
  	#@goods += items
  end

  def order_by_name(name)
    selection = @goods.select {|item| item.name == name}
  end

  def order_by_price(price)
    selection = @goods.select {|item| item.price == price}
  end
end
