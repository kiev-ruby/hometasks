# class shop
class Shop
  attr_accessor :name, :items

  def initialize(name, items = [])
    @name = name
    @items = items
  end

  def add_item(item)
    @items << item
  end

  def items_by_category(category)
    @items.select{|item| item.category == category }
  end

  def show_by_name
    puts items.sort{|x, y| x.item <=> y.item }
  end

  def show_by_category
    puts items.sort{|x, y| x.category <=> y.category }
  end

  def show_items_by(show_by)
    if show_by == 'name'
      send :show_by_name
    else
      send :show_by_category
    end
  end

  def remove_item
    @items.delete{|item| item.name == name }
  end

  def show_items
    puts items
    puts "\n"
  end

  def sort_by_price
    puts items.sort{ |x, y| x.price <=> y.price }
  end

  def cost_items
    @items.inject(0){|total, item| total + item.price }
  end

  def info
    puts "Shop name: #{name}"
    puts "Total items cost: #{cost_items} $"
    puts "\n"
  end
end

