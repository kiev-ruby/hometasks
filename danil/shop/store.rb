class Store

  attr_accessor :name

  def initialize name
    @name = name
    @store_items = []
  end

  def add_item (item, amount = 1)
    check_amount(amount)
    if (@store_items.include?(item))
      @store_items.find { |found_item| found_item.eql? item }.amount += amount
      puts "found it!"
    else
      item.amount = amount
      @store_items << item
    end
  end

  def get_items
    @store_items
  end

  def get_items_by_category category
    @store_items.select { |item| item.category == category }
  end

  def remove_item (item, amount = 1)
    check_amount(amount)
    if (item.is_a?(String))
      remove_by_name(item, amount)
    else
      remove_by_object(item, amount)
    end
  end

  def get_total_price
    @store_items.inject(0){ |total, item| total += item.price * item.amount}
  end

  def get_goods_ordered_by order_by
    ordered_goods = nil
    if order_by == "price"
      ordered_goods = @store_items.sort_by { |item| item.price }
    elsif order_by == "name"
      ordered_goods = @store_items.sort_by { |item| item.name.to_sym }
    end
    ordered_goods
  end

  private 

    def check_amount amount
      if amount < 1
        raise "Amount of items added can not be less or equal to zero"
      end
    end

    def remove_by_name (name, amount)
      found_item = @store_items.find { |item| item.name == name }
      remove_by_object(found_item, amount)
    end

    def remove_by_object (item, amount)
      if (amount >= item.amount)
        @store_items.delete(item)
      else
        item.amount -= amount
      end
    end

end
