class UserFood < ApplicationRecord
  belongs_to :user
  belongs_to :food
  has_many :food_actions, dependent: :nullify

  validates :user_id, :food_id, :deadline_date, presence: true
  validates :quantity, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 100 }
  validates :mini_memo, length: { maximum: 50 }, allow_nil: true

  scope :expired, -> { where("deadline_date < ?", Time.current) }
  scope :two_days_ago, -> { where(deadline_date: Time.current..2.days.from_now) }
  scope :five_days_ago, -> { where(deadline_date: 3.days.from_now..5.days.from_now) }
end
