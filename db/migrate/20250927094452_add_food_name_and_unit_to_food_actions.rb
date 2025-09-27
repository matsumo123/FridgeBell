class AddFoodNameAndUnitToFoodActions < ActiveRecord::Migration[7.2]
  def change
    add_column :food_actions, :food_name, :string
    add_column :food_actions, :unit, :string
  end
end
