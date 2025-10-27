FactoryBot.define do
  factory :food do
    sequence(:name) { |n| "food_name_#{n}" }
    quantity { 1 }
    unit { "個" }
    default_deadline { 7 }
    association :category
  end
end