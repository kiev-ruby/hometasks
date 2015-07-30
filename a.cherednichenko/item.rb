# class Item
class Item
  attr_accessor :name, :category, :price, :count

  def initialize(name, category, price = 0.0, count = 1)
    fail 'Item name is less than 5 symbols' if name.length < 5
    @name = name
    @price = price
    @count = count
    @category = category
  end

  def to_s
    "Name: #{name} Category: #{category} Price: #{price}, Count:= #{count}"
  end
end
