class ChangeColumnNullFoodNameAndUnitInFoodActions < ActiveRecord::Migration[7.2]
  def change
    change_column_null :food_actions, :food_name, false
    change_column_null :food_actions, :unit, false
  end
end
