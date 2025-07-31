class CreateFoodActions < ActiveRecord::Migration[7.2]
  def change
    create_table :food_actions do |t|
      t.references :user, foreign_key: true, null: false
      t.references :user_food, foreign_key: true, null: false
      t.integer :action_type, null: false
      t.datetime :action_date, null: false
      t.integer :quantity, null: false

      t.timestamps
    end
  end
end
