class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :user
      t.references :likeable, polymorphic: true
      t.timestamps
    end
    add_index :likes, :likeable_id
    add_index :likes, :likeable_type
    add_index :likes, :user_id
  end
end
