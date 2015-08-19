class Shop
  attr_accessor :name, :items

  def initialize(name = 'My shop', items = [])
    @name = name
    @items = items
  end

  @@categories = ['cat-1', 'cat-2', 'cat-3']

  def add_category(category)
    @@categories << category unless @@categories.include?(category)
  end

  def list_all_categories
    @@categories.each { |category| puts "#{category}  " }
  end

# Function for generation test content. n - number of items
  def content_creator(n)
    @n = @@categories.size
    n.to_i.times do |item|
      item += 1
      item = Item.new("Comp_item_#{item}", "#{@@categories[rand(0..@n - 1)]}", rand(1000), rand(5))
      @items.push(item)
    end
  end

  def add_item(name, category, price, quantity)
    item = Item.new(name, category, price, quantity)
    if name.size > 5 && @@categories.include?(category) && @items.any? { |item| item.name == name } == false
      @items << item
    end
  end

  def list_all_items
    puts @items
  end

  def delete_by_name(name)
    @items.reject! { |item| item.name == name }
  end

  def total_cost
    total = items.inject(0) { |sum, item| sum + item.price * item.quantity}
  end

#  def remove_same_items(name, quantity_remove)
#    @items.each do|item|
#      if item.name == name && item.quantity >= quantity_remove
#        item.quantity -= quantity_remove
#      end
#    end
#  end

  def remove_same_items(name, quantity_remove)
    if @items.detect { |item| item.name == name && item.quantity >= quantity_remove}
       @items.each { |item| item.quantity -= quantity_remove if item.name == name } 
    end
  end

  def sort_by_category(category)
    items_by_category = items.select { |item| item.category == category }
    items_by_category.each { |item| puts item }
  end

  def sort(sort_by = 'name', order = 'increase')
    if sort_by == 'name'
      sort_items = @items.sort! { |a, b| a.name <=> b.name }      
    elsif sort_by == 'price'
      sort_items = @items.sort! { |a, b| a.price <=> b.price }
    end
    sort_items = sort_items.reverse! if order == 'decrease'
  end
end