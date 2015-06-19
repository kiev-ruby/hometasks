class User 
  attr_accessor :profile, :store

  private

  def create_profile
  self.profile = Profile.create(:user => self) 
  if self.profile.nil?
    self.profile
  end

  def add_store store
    @store.push store
  end
end
