class FoodAction < ApplicationRecord
  belongs_to :user
  belongs_to :user_food
  enum :action_type, { consumed: 0, discarded: 1 }, validate: true

  validates :user_id, :user_food_id, :action_type, :action_date, :quantity, presence: true
  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
end
