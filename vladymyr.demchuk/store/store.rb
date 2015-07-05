# class Store
class Store
  attr_accessor :name, :items

  def initialize(name)
    @name = name
    @items = []
  end

  def add_item(item)
    items << item unless item.name.nil?
  end

  def add_items(*new_items)
    new_items.each { |item| items << item unless item.name.nil? }
  end

  def delete_item(name)
    items.delete_if { |item| item.name == name }
  end

  def show_items
    puts "\nItems in #{name} store:\n "
    items.each { |item| puts item.to_s }
  end

  def total_cost
    total_cost = 0
    items.each { |item| total_cost += item.price * item.quantity }
    total_cost
  end

  def set_quantity(name, quantity)
    items.each { |item| item.quantity = quantity if item.name == name }
  end

  def remove_quantity(name, quantity)
    items.each { |item| item.quantity -= quantity if item.name == name && item.quantity >= quantity }
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
end
