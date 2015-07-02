class ComputerItems

  attr_accessor :items,:name,:price

  def initialize(options={})
    @items=[]
    @name=options[:name]
    @price=options[:price]
  end

  def add_items(item)
    @items.push item
  end

  def delete_items
    @items.pop
  end

end

