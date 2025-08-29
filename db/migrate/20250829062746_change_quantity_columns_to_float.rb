class ChangeQuantityColumnsToFloat < ActiveRecord::Migration[7.2]
  def change
    change_column :foods, :quantity, :float
    change_column :user_foods, :quantity, :float
    change_column :food_actions, :quantity, :float
  end
end
