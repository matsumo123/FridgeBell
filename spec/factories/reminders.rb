FactoryBot.define do
  factory :reminder do
    days_before { 2 }
    remind_time { 2.day.from_now }
    association :user
  end
end
