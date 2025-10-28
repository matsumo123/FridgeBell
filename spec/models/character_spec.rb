require 'rails_helper'

RSpec.describe Character, type: :model do
  describe "バリデーションチェック" do
    it "ステージ番号、説明があれば有効であること" do
      character = build(:character)
      expect(character).to be_valid
    end

    it "ステージ番号は必須項目であること" do
      character = build(:character, stage_number: nil)
      expect(character).to be_invalid
      expect(character.errors[:stage_number]).to include("を入力してください")
    end

    it "説明は必須項目であること" do
      character = build(:character, description: nil)
      expect(character).to be_invalid
      expect(character.errors[:description]).to include("を入力してください")
    end

    it "ステージ番号は整数であること" do
      character = build(:character, stage_number: 1.5)
      expect(character).to be_invalid
      expect(character.errors[:stage_number]).to include("は整数で入力してください")
    end

    it "ステージ番号は0以上であること" do
      character = build(:character, stage_number: -1)
      expect(character).to be_invalid
      expect(character.errors[:stage_number]).to include("は0以上の値にしてください")
    end

    it "説明は50文字以下であること" do
      character = build(:character, description: "a" * 51)
      expect(character).to be_invalid
      expect(character.errors[:description]).to include("は50文字以内で入力してください")
    end
  end

  describe "アソシエーション" do
    it "複数のユーザーキャラクターを持てること" do
      character = create(:character, stage_number: 0)
      user1 = create(:user) # after_createでuser_characterが生成
      user2 = create(:user)
      expect(character.user_characters).to include(user1.user_character, user2.user_character)
    end
  end
end
