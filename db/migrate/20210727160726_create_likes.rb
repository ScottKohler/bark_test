class CreateLikes < ActiveRecord::Migration[5.1]
  def up
    create_table :likes do |t|
      t.references :dog, foreign_key: :dog_id
      #t.integer :likes
      t.timestamps
    end
  end

  def down
    drop_table :likes
  end
end
