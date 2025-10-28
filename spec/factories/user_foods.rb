FactoryBot.define do
  factory :user_food do
    quantity { 1 }
    deadline_date { 1.week.from_now }
    association :user
    association :food
  end
end
