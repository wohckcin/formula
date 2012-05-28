class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :name
      t.string :title
      t.string :title_alternative
      t.text :description
      t.integer :postion_at,:null => false, :default => ""
      t.integer :nodes_count, :null => false, :default => ""

      t.timestamps
    end
  end
end
