class Shop

  def initialize(name)
    @name = name
    @items = []
  end

  def self.random_shop(n)
    shop = Shop.new(random_string)
    n.times { shop.add_items(ComputerItem.new(random_string, rand(10..10_000), random_string, rand(1..5))) }
    shop
  end

  def add_items(*items)
    items.each { |elm| @items << elm }
  end

  def set_quantity(num, item_name)
    @items.find { |i| i.name == item_name }.quantity = num
  end

  def show_items(arg = :price)
    puts @items.sort_by(&arg) if arg == :price || arg == :name
  end

  def select_goods(category)
    puts @items.select { |i| i.category == category }
  end

  def delete_item(item_name)
    @items.delete_if { |i| i.name == item_name }
  end

  def remove_number(item_name,num)
    @items.find { |i| i.name == item_name}.quantity -= num
  end

  def total_cost
    @items.inject(0) { |a, e| a + e.price * e.quantity }
  end

  private

  def self.random_string
    Array.new(rand(6..10)) { [*'a'..'z'].sample }.join.capitalize
  end

end
