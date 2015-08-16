# class shop
class Shop
  attr_accessor :name, :items

  def initialize(name)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def set_quantity(name, quantity)
    items.find { |item| item.name == name }.quantity = quantity
  end

  def select_by_category(category)
    @items.select { |item| item.category == category }
  end

  def sort_by_price
    puts items.sort { |x, y| x.price <=> y.price }
  end

  def show_by_name
    puts items.sort { |x, y| x.item <=> y.item }
  end

  def show_by_category
    puts items.sort { |x, y| x.category <=> y.category }
  end

  def show_items_by(show_by)
    if show_by == 'name'
      send :show_by_name
    else
      send :show_by_category
    end
  end

  def remove_item(name)
    @items.delete(@items.find { |item| item.name == name })
  end

  def delete_item(name, quantity = 1)
    @items.find { |item| item.name == name }.quantity -= quantity
  end

  def cost_items
    @items.inject(0) { |total, item| total + item.price }
  end

  def show_items
    puts items
    puts "\n"
  end

  def info
    puts "Shop name: #{name}"
    puts "Total items cost: #{cost_items} $"
    puts "\n"
  end
end

