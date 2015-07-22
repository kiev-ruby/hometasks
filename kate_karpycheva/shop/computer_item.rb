class ComputerItem
  attr_reader :name, :price, :category
  def initialize(name, price, category)
    if name.length < 5
      raise ArgumentError.new("Name of item #{name} is less than 5 symbols")
    end
    @name = name
    @price = price
    @category = category
  rescue ArgumentError => error
    p error.message
  end
end
