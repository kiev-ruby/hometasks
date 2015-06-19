class Store
  attr_accessor :name, :list

  def initialize(name, list)
    @name = name
    @list = list
  end

  def add(item)
    @items << item
  end

  def insert_batch_of_items(*items)
    @items.push (items)
  end

  def show_item_by_name(item_name)
    item_to_show = [comp1, comp2, comp3]
    @item.each do |item|
    if item.name == item_name
      item_to_show << item
    end
  end

  def show_quantity_of_same_items
    item_name.each { |item_name| counts[item_name] += 1 }
  end 

  def show_item_by_price(price)
    item_to_show = [comp1, comp2, comp3]
    @item.each do |item|
    if item.price == price
      item_to_show << item
    end
  end

  def delete_item(item_name, quantity)
    @item.delete_if { |item| item.name == item.name }
    delete_items.quantity -= quantity
  end

  def show_list(items)
    show_list.each { |item| puts item }
  end

  def total_price(total)
    total_price = item.sum do |item|
    item.quantity * item.price
    end
  end
end
