class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.references :user
      t.string :title
      t.text :content
      t.text :content_html
      t.string :type
      t.references :node
      t.integer :replies_count, :null => false, :default => ""
      t.integer :likes_count, :null => false, :default => ""
      t.integer :views_count, :null => false, :default => ""
      t.datetime :replied_at
      t.datetime :sticky_at

      t.timestamps
    end
    add_index :topics, :user_id
    add_index :topics, :node_id
  end
end
