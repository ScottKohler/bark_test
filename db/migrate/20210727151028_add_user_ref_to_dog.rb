#bundle exec rails g migration AddUserRefToDog
class AddUserRefToDog < ActiveRecord::Migration[5.1]

  def up
    add_reference :dogs, :user, index: true
  end

  def down
    remove_reference :dogs, :user
  end
end
