require 'rails_helper'

RSpec.describe Character, type: :model do
  describe "バリデーションチェック" do
    it "ステージ番号、説明があれば有効であること" do
      character = build(:character)
      expect(character).to be_valid
    end

    it "ステージ番号は必須項目であること" do
      character = build(:character, stage_number: nil)
      character.valid?
      expect(character.errors[:stage_number]).not_to be_empty
    end

    it "説明は必須項目であること" do
      character = build(:character, description: nil)
      character.valid?
      expect(character.errors[:description]).not_to be_empty
    end

    it "ステージ番号は整数であること" do
      character = build(:character, stage_number: 1.5)
      character.valid?
      expect(character.errors[:stage_number]).not_to be_empty
    end

    it "ステージ番号は0以上であること" do
      character = build(:character, stage_number: -1)
      character.valid?
      expect(character.errors[:stage_number]).not_to be_empty
    end

    it "説明は50文字以下であること" do
      character = build(:character, description: "a" * 51)
      character.valid?
      expect(character.errors[:description]).not_to be_empty
    end
  end

  describe "アソシエーション" do
    it "複数のユーザーキャラクターを関連付けられること" do
      character = create(:character, stage_number: 0)
      user1 = create(:user) # after_createでuser_characterが生成
      user2 = create(:user)
      expect(character.user_characters).to include(user1.user_character, user2.user_character)
    end
  end
end
