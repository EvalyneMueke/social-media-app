class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.references :recipient, foreign_key: { to_table: :users }

      t.references :sender, foreign_key: { to_table: :users }

      t.string :notification_type

      t.timestamps
    end
  end
end
