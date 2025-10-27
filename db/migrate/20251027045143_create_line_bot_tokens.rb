class CreateLineBotTokens < ActiveRecord::Migration[7.2]
  def change
    create_table :line_bot_tokens do |t|
      t.string :line_user_id, null: false
      t.string :token, null: false

      t.timestamps
    end
    add_index :line_bot_tokens, :line_user_id, unique: true
  end
end
