class LineBotToken < ApplicationRecord
  validates :line_user_id, presence: true, uniqueness: true
  validates :token, presence: true
end
