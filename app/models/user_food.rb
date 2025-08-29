class UserFood < ApplicationRecord
  belongs_to :user
  belongs_to :food
  has_many :food_actions, dependent: :destroy

  validates :user_id, :food_id, :deadline_date, presence: true
  validates :quantity, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 100 }
  validates :mini_memo, length: { maximum: 50 }, allow_nil: true
end
