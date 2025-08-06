class AddIndexToUserCharactersUserId < ActiveRecord::Migration[7.2]
  def change
    remove_index :user_characters, :user_id
    add_index :user_characters, :user_id, unique: true
  end
end
