class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :nickname  
      t.string :gender
      t.date :birthday
      t.text :bio
      t.string :tagline
      t.string :avatar
      t.string :location
      t.string :website

      t.timestamps
    end
  end
end
