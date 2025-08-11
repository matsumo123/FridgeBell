class RenameLastConsumedAtColumnToUserCharacters < ActiveRecord::Migration[7.2]
  def change
    rename_column :user_characters, :last_consumed_at, :last_action_at
  end
end
