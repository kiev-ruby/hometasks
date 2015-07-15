# class user
class User
  attr_accessor :shops

  def initialize(shops = [])
    @shops = shops
  end

  def create_shop(name)
    new_shop = Shop.new(name)
    @shops.push(new_shop)
  end
end
