class UserFood < ApplicationRecord
  belongs_to :user
  belongs_to :food
  has_many :food_actions, dependent: :destroy

  validates :user_id, :food_id, :deadline_date, presence: true
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :mini_memo, length: { maximum: 50 }, allow_nil: true
end
