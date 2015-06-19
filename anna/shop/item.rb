class Item
  attr_accessor :name, :price, :quantity, :category

  def initialize name, price
    @name = name
    puts "Item should have 5 letters!" if name.size < 5
    @price = price
    @quantity = quantity
    @category = category
  end

  def add_category_name(category_name)
    @category_name << category_name
  end

  def select_category(category)
    category_to_show = [cat1, cat2, cat3]
    @category.each do |category|
    if category.name == category_name
      category_to_show << category
    end
  end
end
