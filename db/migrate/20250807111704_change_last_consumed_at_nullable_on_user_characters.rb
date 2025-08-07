class ChangeLastConsumedAtNullableOnUserCharacters < ActiveRecord::Migration[7.2]
  def change
    change_column_null :user_characters, :last_consumed_at, true
  end
end
