FactoryBot.define do
  factory :character do
    stage_number { 0 }
    description { "stage description" }

    trait :with_image do
      after(:build) do |character|
        file_path = Rails.root.join("db/seeds/images/character/ステージ0.png")
        character.image.attach(
          io: File.new(file_path),
          filename: "ステージ0.png",
          content_type: "image/png"
        )
      end
    end
  end
end
