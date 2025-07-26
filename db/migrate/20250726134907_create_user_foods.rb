class CreateUserFoods < ActiveRecord::Migration[7.2]
  def change
    create_table :user_foods do |t|
      t.references :user, foreign_key: true, null: false
      t.references :food, foreign_key: true, null: false
      t.integer :quantity, null: false
      t.date :deadline_date, null: false
      t.text :mini_memo

      t.timestamps
    end
  end
end
