class Dog < ApplicationRecord
  has_many_attached :images
  has_and_belongs_to_many :users
  has_many :likes

  #being handled by _form.html.erb
  def add_owner u
    p "add owner #{u.name}"
    self.users << u
  end


  def number_of_likes_per_hour
    self.likes.where("created_at > ?", 1.hour.ago).count
  end


end
