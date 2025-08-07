class UserCharacter < ApplicationRecord
  belongs_to :user
  belongs_to :character
  validates :user_id, :character_id, presence: true
  validates :consecutive_days, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
