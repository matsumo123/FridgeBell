class ChangeColumnNullUserFoodIdToFoodActions < ActiveRecord::Migration[7.2]
  def change
    change_column_null :food_actions, :user_food_id, true
  end
end
