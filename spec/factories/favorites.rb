FactoryBot.define do
  factory :favorite do
    association :user
    association :food
  end
end
