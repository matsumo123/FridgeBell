class CreateUserCharacters < ActiveRecord::Migration[7.2]
  def change
    create_table :user_characters do |t|
      t.references :user, null: false, foreign_key: true
      t.references :character, null: false, foreign_key: true
      t.integer :consecutive_days, null: false, default: 0
      t.datetime :last_consumed_at, null: false

      t.timestamps
    end
  end
end
