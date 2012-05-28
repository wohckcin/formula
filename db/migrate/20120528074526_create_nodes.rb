class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.string :slug
      t.string :name
      t.string :status
      t.references :section
      t.text :description
      t.integer :postion_at, :null => false, :default => ""
      t.integer :posts_count, :null => false, :default => ""

      t.timestamps
    end
    add_index :nodes, :section_id
  end
end
