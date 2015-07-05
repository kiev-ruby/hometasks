require './user'
require './item'
require './store'

class Application

  def initialize
    @items_buffer = []
    @user = User.new
  end

  attr_accessor :items_buffer, :user

  def create_store name
     @user.create_store(name)
  end

  def create_item (name, price, category)
    @items_buffer << Item.new(name, price, category)
  end

  def add_item_to_store (item, store_name, amount)
    @user.get_store_by_name(store_name).add_item(item, amount)
  end

  def add_items_to_store(store_name, *items)
    items.each { |item| @user.get_store_by_name(store_name).add_item(item) }
  end
				
  def show_stores
    @user.stores.each { |store| puts "#{store.name}" }
  end

  def show_items_from store_name
    @user.get_store_by_name(store_name).get_items.each { |item| puts "#{item.name}"  }
  end
	
  def remove_item (item, store_name, amount)
    @user.get_store_by_name(store_name).remove_item(item, amount)
  end

  def remove_item_by_name (name, store_name, amount)
    remove_item(name, store_name, amount)
  end

  def get_total_cost store_name
    @user.get_store_by_name(store_name).get_total_price
  end

  def get_items_by_category (category_name, store_name)
    @user.get_store_by_name(store_name).get_items_by_category(category_name)
  end

  def order_goods_by_price store_name
    @user.get_store_by_name(store_name).send(:get_goods_ordered_by, "price")
  end

  def order_goods_by_name store_name
    @user.get_store_by_name(store_name).send(:get_goods_ordered_by, "name")
  end

  def generate_random_store
    @user.create_store("randomStore")
    random = Random.new()
    20.times do 
      new_item = Item.new("itemName #{random.rand(100)}", random.rand*100, "category")
      @user.get_store_by_name("randomStore").add_item(new_item)
    end

  end
  
end
