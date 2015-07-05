class User

  attr_accessor :stores

  def initialize
    @stores = []
  end

  def create_store name
    new_store = Store.new(name);
    @stores.push(new_store)
  end

  def get_store_by_name store_name
    @stores.find { |store| store.name == store_name}
  end

end
