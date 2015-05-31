# define class Store
class Store
	attr_accessor :name, :list

	def initialize name, list
		@name = name
		@list = list
	end
end

# define class Category
class Category < Store

	attr_accessor :cat_name, :item

  def initialize cat_name, item
		@cat_name = cat_name
		@item = item
	end
end
# define method to add list name into the store 
  def add_cat_name cat_name
    @cat_name << cat_name
  end

# define class Item
class Item < Category 
	attr_accessor :item_name, :price

  def initialize item_name, price
		@item_name = item_name
		@price = price
	end
end
# define method to add new items into the defined category
  def add_item item
	  @item << item
  end

# define method to show items by their names
  def show_item_by_name item_name
	  item_to_show = [comp1, comp2, comp3]
	  @item.each do |item|
		if item.name == item_name 
			item_to_show << item
    end
	end
end
# define method to show price of defined item
  def show_item_by_price price
	  item_to_show = [comp1, comp2, comp3]
	  @item.each do |item|
		if item.price == price
		   item_to_show << item
		end
	  end
  end	
  end
