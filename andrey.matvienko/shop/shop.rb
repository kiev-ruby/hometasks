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

  def remove_item
    remove_item = @items.find { |item| item.name == name }
    @items.delete(remove_item)
  end

  def show_items
    puts items
    puts "\n"
  end

  def sort_by_price
    puts items.sort { |x, y| x.price <=> y.price }
  end

  def show_by_category(category_name)
    @items.each do |items|
      puts items if items.category = category_name
    end
  end

  def show_by_name
    puts items.sort { |x, y| x.name <=> y.name }
  end

  def cost_items
    @items.inject(0) { |total, item| total + item.price }
  end

  def info
    puts "Shop name: #{name}"
    puts "Total items cost: #{cost_items} $"
    puts "\n"
  end
end

