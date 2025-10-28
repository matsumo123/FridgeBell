FactoryBot.define do
  factory :character do
    sequence(:stage_number) { |n| n }
    description { "stage description" }
  end
end
