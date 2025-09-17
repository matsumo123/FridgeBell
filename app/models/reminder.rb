class Reminder < ApplicationRecord
  belongs_to :user

  validates :user_id, :remind_time, presence: true
  validates :days_before, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 30 }
end
