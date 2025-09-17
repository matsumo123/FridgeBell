class CreateReminders < ActiveRecord::Migration[7.2]
  def change
    create_table :reminders do |t|
      t.references :user, foreign_key: true, null: false
      t.integer :days_before, null: false
      t.time :remind_time, null: false

      t.timestamps
    end
  end
end
