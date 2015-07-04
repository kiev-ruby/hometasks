class Shop
  attr_accessor :name, :items

  def initialize(name, items = [])
    @name = name
    @items = items
  end

  def add(*set_of_items)
    set_of_items.each_with_index do |item, index|
      if item.is_a? Item
        items.push(item)
      else
        puts "sorry, but item #{index} is not valid"
      end
    end
  end

  def all_items
    items.each { |item| puts item.to_s }
  end

  def delete_by_name(name)
    items.delete_if { |item| item.name == name }
  end

  def total_cost
    items.inject { |cost, item| cost + item.price * item.quantity }
  end

  def remove_same_for(item_name, number)
    item = items.detect { |item| item.name == item_name }
    raise 'sorry, but we can\'t find your item' if item.nil?
    if item.quantity >= number
      item.quantity - number
    else
      puts "try #{item.quantity} or less"
    end
  end

  def find_by_category(category)
    items.select { |item| item.category == category }
  end

  def order_by_price
    items.sort_by { |item| item.price }
  end

  def order_by_name
    items.sort_by { |item| item.name }
  end
end
