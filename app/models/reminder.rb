class Reminder < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true, uniqueness: true
  validates :days_before, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 7 }
  validates :remind_time, presence: true
end
