class AddAvailabilityToFoodActions < ActiveRecord::Migration[7.2]
  def change
    add_column :food_actions, :availability, :boolean, null: false, default: false
  end
end
