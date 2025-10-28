FactoryBot.define do
  factory :user_character do
    consecutive_days { 0 }
    association :character
    association :user
  end
end
