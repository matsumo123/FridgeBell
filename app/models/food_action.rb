class FoodAction < ApplicationRecord
  belongs_to :user
  belongs_to :user_food
  enum :action_type, { consumed: 0, discarded: 1 }, validate: true

  validates :user_id, :user_food_id, :action_type, :action_date, :quantity, :food_name, :unit, presence: true
  validates :quantity, numericality: { greater_than: 0, less_than_or_equal_to: 100 }
  validates :availability, inclusion: { in: [ true, false ] }
  validates :food_name, length: { maximum: 15 }
  validates :unit, length: { maximum: 5 }
end
