class Shop
  attr_accessor :name

  def initialize(name)
    @name = name
    @goods = []
  end

  def add_item(item)
    @goods << item
  end

  def delete(name, number = nil)
    if number.nil?
      @goods.delete_if { |item| item.name == name }
    else
      index = @goods.index { |i| i.name == name }
      @goods[index].number -= number
    end
  end

  def set_number(name, n)
    index = @goods.index { |i| i.name == name }
    @goods[index].number = n
  end

  def display_goods(param = 1)
    case param
    when 1 then @goods.sort_by! { |item| item.name }
    when 2 then @goods.sort_by! { |item| item.price }
    when 3 then @goods.sort_by! { |item| item.number }
    when 4 then @goods.sort_by! { |item| item.category }
    else puts 'Cannot be sorted'
    end
    puts "\nGoods list "
    @goods.each do |i|
      puts "#{i.name} \$#{i.price} #{i.number} pieces #{i.category}"
    end
  end

  def display_total
    total = 0
    @goods.each do |i|
      total += i.price * i.number
    end
    puts "\nTotal: #{total}"
  end

  def select_goods(category)
    selection = @goods.select { |item| item.category == category }
    selection.each do |item|
      puts "#{item. name}  \$#{item.price}  #{item.number}"
    end
  end

  def add_many(items)
    items.each do |item|
      @goods << item
    end
  end

  def order_by_name(name)
    @goods.select { |item| item.name == name }
  end

  def order_by_price(price)
    @goods.select { |item| item.price == price }
  end
end
