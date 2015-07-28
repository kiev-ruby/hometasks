class Item
  attr_accessor :name, :price, :number, :category

  def initialize(name, price, number = 1, category = 'Misc')
    fail 'ERROR: Too short name.' if name.size < 5
    @name = name
    @price = price
    @number = number
    @category = category

    rescue
      puts "\nERROR: Too short name. Enter a valid name (min 5 characters): "
      name = gets.chomp
      retry
  end
end
