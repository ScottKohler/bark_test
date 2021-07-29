class User < ApplicationRecord
  has_and_belongs_to_many :dogs
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #devise :database_authenticatable, :registerable,
  #       :recoverable, :rememberable, :trackable, :validatable
  #has_one :dog
  #has_and_belongs_to_many :dogs
  def self.current_user
    User.find_by_name(:Scott)
  end

end
