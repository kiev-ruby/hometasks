class Shop
  attr_accessor :name

  def initialize(name)
    @name = name
    @goods = []
  end

  def add_items(items)
    if items.is_a? Array
      items.each do |item|
        @goods << item
      end
    else
      @goods << items
    end
  end

  def delete(name)
    @goods.delete_if { |item| item.name == name }
  end

  def set_number(name, n)
    @goods.find { |item| item.name == name } .number = n
  end

  def display_goods(sym = nil, type = :asc)
    @goods.sort_by!(&sym) if sym == :name || sym == :price || sym == :number || sym == :category
    @goods.reverse! if type == :desc
    puts "\nGoods list "
    @goods.each(&:to_s)
  end

  def display_total
    total = @goods.inject(0) { |a, e| a + e.price * e.number }
    puts "\nTotal: #{total}"
  end

  def select_goods(category)
    selection = @goods.select { |item| item.category == category }
    selection.each(&:to_s)
  end

  def order_by_name
    @goods.sort_by!(&:name)
  end

  def order_by_price
    @goods.sort_by!(&:price)
  end
end
