FactoryBot.define do
  factory :user do
    name { "User" }
    sequence(:email) { |n| "user_#{n}@example.com" }
    password { "Password1234" }
    password_confirmation { "Password1234" }
  end
end
