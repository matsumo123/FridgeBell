class AddUniqueIndexToRemindersUserId < ActiveRecord::Migration[7.2]
  def change
    remove_index :reminders, name: "index_reminders_on_user_id"
    add_index :reminders, :user_id, unique: true, name: "index_reminders_on_user_id"
  end
end
