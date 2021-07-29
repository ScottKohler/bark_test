#bundle exec rails g migration CreateDogsAndUsers
class CreateDogsAndUsers < ActiveRecord::Migration[6.1]
  def up
    create_table :dogs_users, id: false do |t|
      t.integer "dog_id"
      t.integer "user_id"
      t.datetime "created_at"
    end
    add_index("dogs_users", ["dog_id","user_id"])
  end
  def down
    drop_table :dogs_users
  end
end
