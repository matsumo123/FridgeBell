require 'rails_helper'

RSpec.describe UserCharacter, type: :model do
  describe "バリデーション" do
    let!(:character) { create(:character, stage_number: 0) }
    let!(:user) { create(:user) } # before_createでuser_characterが生成される
    it "必須属性が揃っていれば有効であること(user, character, consecutive_days)" do
      expect(user.user_character).to be_valid
    end

    it "ユーザーが未設定なら無効であること" do
      user_character = build(:user_character, user: nil)
      expect(user_character).to be_invalid
      expect(user_character.errors[:user]).to include("を入力してください")
    end

    it "user_idが重複している場合は無効であること" do
      user_character = build(:user_character, user: user)
      expect(user_character).to be_invalid
      expect(user_character.errors[:user_id]).to include("はすでに存在します")
    end

    it "キャラクターが未設定なら無効であること" do
      user_character = build(:user_character, user: user, character: nil)
      expect(user_character).to be_invalid
      expect(user_character.errors[:character]).to include("を入力してください")
    end

    it "consecutive_daysは必須項目であること" do
      user_character = build(:user_character, user: user, consecutive_days: nil)
      expect(user_character).to be_invalid
      expect(user_character.errors[:consecutive_days]).to include("を入力してください")
    end

    it "consecutive_daysは整数であること" do
      user_character = build(:user_character, user: user, consecutive_days: 1.5)
      expect(user_character).to be_invalid
      expect(user_character.errors[:consecutive_days]).to include("は整数で入力してください")
    end

    it "consecutive_daysは0以上であること" do
      user_character = build(:user_character, user:user, consecutive_days: -1)
      expect(user_character).to be_invalid
      expect(user_character.errors[:consecutive_days]).to include("は0以上の値にしてください")
    end
  end

  describe "アソシエーション" do
    let!(:character) { create(:character, stage_number: 0) }
    let!(:user) { create(:user) } # after_createでステージ0のuser_characterが生成
    it "ユーザーに属していること" do
      user_character = UserCharacter.find_by(user_id: user.id)
      expect(user_character.user).to eq user
    end

    it "キャラクターに属していること" do
      expect(user.user_character.character).to eq character
    end
  end
end
