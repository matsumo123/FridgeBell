FactoryBot.define do
  factory :food_action do
    action_type { :consumed }
    action_date { Date.today }
    quantity { 1 }
    availability { true }
    association :user
    association :user_food
  end
end
