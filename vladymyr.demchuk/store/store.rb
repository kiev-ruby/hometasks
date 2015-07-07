# class Store
class Store
  attr_accessor :name, :items

  def initialize(name)
    @name = name
    @items = []
  end

  def show_items
    puts "\nItems in #{name} store:\n "
    items.each { |item| puts item.to_s }
  end

  def add_item(item)
    items << item unless item.name.nil?
  end

  def add_items(*new_items)
    new_items.each { |item| items << item unless item.name.nil? }
  end

  def delete_item(name)
    items.each do |item|
      if item.name == name
        items.delete(item)
        puts "Item #{name} was deleted"
        return nil
      end
    end
    puts "Item #{name} not found"
  end

  def total_cost
    total_cost = 0
    items.each { |item| total_cost += item.price * item.quantity }
    total_cost
  end

  def set_quantity(name, quantity)
    items.each do |item|
      if item.name == name
        old_quantity = item.quantity
        item.quantity = quantity.to_i
        puts "Quantity of #{name} was changed form #{old_quantity} to #{quantity}"
        return nil
      end
    end
    puts "Item #{name} not found"
  end

  def remove_quantity(name, quantity)
    quantity = quantity.to_i
    items.each do |item|
      if item.name == name
        if item.quantity >= quantity
          old_quantity = item.quantity
          item.quantity -= quantity
          puts "Quantity was reduced from #{old_quantity} to #{old_quantity - quantity}"
        else
          puts "You dont have enough items, enter #{item.quantity} or less"
        end
        return nil
      end
    end
    puts "Item #{name} not found"
  end

  def select_by_category(category)
    items.select { |item| item.category == category }
  end

  def show_category(category)
    mathes = 0
    items.each do |item|
      if item.category == category
        mathes += 1
        puts item.to_s
      end
    end
    puts "#{category} category not found" if mathes == 0
  end

  def order_by_price
    ordered_items = items.sort { |item1, item2| item1.price <=> item2.price }
    ordered_items.each { |item| puts item.to_s }
  end

  def order_by_name
    ordered_items = items.sort { |item1, item2| item1.name <=> item2.name }
    ordered_items.each { |item| puts item.to_s }
  end
end
