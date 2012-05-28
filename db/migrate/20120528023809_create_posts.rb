class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :user
      t.string :title
      t.text :content
      t.text :content_html
      t.string :type
      t.references :node
      t.integer :comments_count, :null => false, :default => ""
      t.integer :likes_count, :null => false, :default => ""
      t.integer :views_count, :null => false, :default => ""
      t.datetime :commented_at
      t.datetime :sticky_at

      t.timestamps
    end
    add_index :posts, :user_id
    add_index :posts, :node_id
  end
end
