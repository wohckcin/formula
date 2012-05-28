class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.references :user
      t.references :topic
      t.text :content
      t.text :content_html
      t.integer :likes_count, :null => false, :default => ""

      t.timestamps
    end
    add_index :replies, :user_id
    add_index :replies, :topic_id
  end
end
