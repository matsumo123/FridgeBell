class BackfillFoodActionsFoodNameAndUnit < ActiveRecord::Migration[7.2]
  def up
    FoodAction.where("food_name IS NULL OR food_name = ''").or(FoodAction.where("unit IS NULL OR unit = ''")).includes(user_food: :food).find_each do |f|
      if f.user_food.present? && f.user_food.food.present?
        food = f.user_food.food
          food_name = f.food_name.present? ? f.food_name : food.name
          unit = f.unit.present? ? f.unit : food.unit
          f.update_columns(food_name: food_name, unit: unit, updated_at: Time.current)
          next
      end

      if f.food_name.blank?
        f.update_columns(food_name: "不明", updated_at: Time.current)
      end

      if f.unit.blank?
        f.update_columns(unit: "個", updated_at: Time.current)
      end
    end
  end
end
