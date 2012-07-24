class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.references :target, polymorphic: true
      t.integer :recipient_id, null: false
      t.string :type
      t.boolean :unread, default: true, null: false
      t.timestamps
    end

    add_index :notifications, ["recipient_id"], name: "index_notifications_on_recipient_id"
    add_index :notifications, ["target_id"], name: "index_notifications_on_target_id"
    add_index :notifications, ["target_type", "target_id"], name: "index_notifications_on_target_type_and_target_id"
  end
end
