require 'rails_helper'

RSpec.describe User, type: :model do
  describe "バリデーション" do
    let!(:character) { create(:character, stage_number: 0) }
    it "ユーザー名、メールアドレス、パスワードがあれば有効であること" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "ユーザー名は必須項目であること" do
      user = build(:user, name: nil)
      expect(user).to be_invalid
      expect(user.errors[:name]).to include("を入力してください")
    end

    it "ユーザー名は12文字以下であること" do
      user = build(:user, name: "a" * 13)
      expect(user).to be_invalid
      expect(user.errors[:name]).to include("は12文字以内で入力してください")
    end

    it "メールアドレスは必須項目であること" do
      user = build(:user, email: nil)
      expect(user).to be_invalid
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "メールアドレスはユニークであること" do
      user1 = create(:user)
      user2 = build(:user)
      user2.email = user1.email
      user2.valid?
      expect(user2.errors[:email]).to include("はすでに存在します")
    end

    it "パスワードは必須項目であること" do
      user = build(:user, password: nil)
      expect(user).to be_invalid
      expect(user.errors[:password]).to include("を入力してください")
    end
  end

  describe "アソシエーション" do
    let!(:character) { create(:character, stage_number: 0) }
    let!(:user) { create(:user) }
    context "1対多" do
      it "複数の食材を登録できること" do
        food1 = create(:food, user: user)
        food2 = create(:food, user: user)
        expect(user.foods).to include(food1, food2)
      end

      it "複数のユーザー食材を持てること" do
        user_food1 = create(:user_food, user: user)
        user_food2 = create(:user_food, user: user)
        expect(user.user_foods).to include(user_food1, user_food2)
      end

      it "複数の食材の行動履歴を持てること" do
        food_action1 = create(:food_action, user: user)
        food_action2 = create(:food_action, user: user)
        expect(user.food_actions).to include(food_action1, food_action2)
      end

      it "複数のお気に入りを持てること" do
        favorite1 = create(:favorite, user: user)
        favorite2 = create(:favorite, user: user)
        expect(user.favorites).to include(favorite1, favorite2)
      end

      it "複数のお気に入り食材を登録できること" do
        food1 = create(:food)
        food2 = create(:food)
        create(:favorite, user: user, food: food1)
        create(:favorite, user: user, food: food2)
        expect(user.favorite_foods).to include(food1, food2)
      end
    end

    context "1対1" do
      it "1つのユーザーキャラクターを持てること" do
        user_character = UserCharacter.find_by(user_id: user.id)
        expect(user.user_character).to eq user_character
      end

      it "1つのリマインドを持てること" do
        reminder = create(:reminder, user: user)
        expect(user.reminder).to eq reminder
      end
    end
  end
end
