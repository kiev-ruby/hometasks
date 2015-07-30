# class Store
class Store
  attr_accessor :name, :items

  def initialize(name)
    @name = name
    @items = []
  end

  def add_item(item)
    items << item
  end

  # batch insert of goods
  def add_items(*new_items)
    new_items.each { |new_item| items << new_item }
  end

  def delete_item(name)
    items.delete_if { |item| item.name == name }
  end

  def show_all_items
    puts "List of items in #{name} store:\n"
    items.each { |item| puts item }
  end

  def total_cost
    items.inject(0) { |sum, item| sum + item.count * item.price }
  end

  def set_count(name, count)
    found_item = items.find { |item| item.name == name }
    found_item.count = count unless found_item.nil?
  end

  def decrease_count(name, count)
    found_item = items.find { |item| item.name == name }
    found_item.count -= count unless found_item.nil? ||
                                     found_item.count <= count
  end

  def select_item_by_category(category)
    items.select { |item| item.category == category }
  end

  def order_items_by_price
    items.sort! { |item1, item2| item1.price <=> item2.price }
  end

  def order_items_by_name
    items.sort! { |item1, item2| item1.name <=> item2.name }
  end

  def to_s
    show_all_items
  end
end
