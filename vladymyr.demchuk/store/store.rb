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

  def add_items(*new_items)
    new_items.each { |item| items << item }
  end

  def delete_item(name)
    items.delete_if { |item| item.name == name }
  end

  def total_cost
    items.inject(0) { |total, item| total + item.price * item.quantity }
  end

  def set_quantity(name, quantity)
    items.find { |item| item.name == name }.quantity = quantity
  end

  def remove_quantity(name, quantity)
    items.find { |item| item.name == name && item.quantity >= quantity }.quantity -= quantity
  end

  def select_by_category(category)
    items.select { |item| item.category == category }
  end

  def show_category(category)
    items.each { |item| puts item.to_s if item.category == category }
  end

  def order_by_price
    items.sort! { |item1, item2| item1.price <=> item2.price }
  end

  def order_by_name
    items.sort! { |item1, item2| item1.name <=> item2.name }
  end

  def order(type)
    if type == 'price'
      send :order_by_price
    else
      send :order_by_name
    end
  end

  # another way
  # def order(type)
    # if type == "price"
      # items.sort! { |item1, item2| item1.price <=> item2.price }
    # else
      # items.sort! { |item1, item2| item1.name <=> item2.name }
    # end
  # end
end
