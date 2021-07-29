#bundle exec rails g migration RemoveUserRefFromDog

class RemoveUserRefFromDog < ActiveRecord::Migration[6.1]
  def change
    remove_reference :dogs, :user
  end
end
