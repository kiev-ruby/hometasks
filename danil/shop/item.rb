class Item

  def initialize (name, price, category)
    check_name (name)
    @name = name
    @price = price
    @category = category
    @amount = 0
  end

  attr_accessor :name, :price, :category, :amount


  def to_s
    @name
  end

private 

  def check_name name
    if (name.length < 5)
      raise "Item's name is too short."
    end
  end

end
