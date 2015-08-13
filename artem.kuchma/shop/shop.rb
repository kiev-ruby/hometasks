class Shop
  attr_accessor :shop_name, :items

  def initialize(shop_name = 'My shop', items = [])
    @shop_name = shop_name
    @items = items
  end

  @@sh_cat = ['cat-1', 'cat-2', 'cat-3']

  def add_category(category)
    @@sh_cat << category if !@@sh_cat.include?(category)
  end

  def list_all_categorys
    @@sh_cat.each { |sh_cat| puts "#{sh_cat}  " }
  end

  def add_item(name, category, price, quantity)
    item = Item.new(name, category, price, quantity)
    if name.size > 5 && @@sh_cat.include?(category) && @items.count { |item| item.name == name } != 1
      @items << item
    end
  end

  def list_all_items
    @items.each { |item| puts item.to_s }
  end

  def delete_by_name(name)
    @items.reject! { |item| item.name == name }
  end

  def total_cost
    @total = 0
    @items.each { |item| @total += item.price * item.quantity }
  end

  def remove_same_items(name, quantity_remove)
    @items.each do|item|
      if item.name == name && item.quantity >= quantity_remove
        item.quantity -= quantity_remove
      end
    end
  end

  def sort_by_category(category)
    i = items.select { |item| item.category == category }
    i.each { |item| puts item }
  end

  # function 'sort_by_name' takes only
  # two arguments - 'increase' or 'decrease'
  def sort_by_name(order = 'increase')
    if order == 'increase'
      puts @items.sort { |a, b| a.name <=> b.name }
    elsif order == 'decrease'
      puts @items.sort { |a, b| b.name <=> a.name }
    end
  end

  #  function 'sort_by_price' takes only
  #  two arguments - 'increase' or 'decrease'
  def sort_by_price(order = 'increase')
    if order == 'increase'
      puts @items.sort { |a, b| a.price <=> b.price }
    elsif order == 'decrease'
      puts @items.sort { |a, b| b.price <=> a.price }
    end
  end
end
