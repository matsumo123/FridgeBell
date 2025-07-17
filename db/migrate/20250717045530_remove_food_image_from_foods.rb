class RemoveFoodImageFromFoods < ActiveRecord::Migration[7.2]
  def change
    remove_column :foods, :food_image, :string
  end
end
