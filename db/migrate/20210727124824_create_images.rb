#bundle exec rails g migration CreateImages
class CreateImages < ActiveRecord::Migration[5.1]
  def up
    create_table :images do |t|
      t.references :dog, foreign_key: :dog_id
      t.string :filename
      t.timestamps
    end
  end

  def down
    drop_table :images
  end
end
