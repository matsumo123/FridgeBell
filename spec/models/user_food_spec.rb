require 'rails_helper'

RSpec.describe UserFood, type: :model do
  describe "バリデーション" do
    let!(:character) { create(:character, stage_number: 0) }
    let!(:user) { create(:user) }
    let!(:category) { create(:category) }
    let!(:food) { create(:food, category: category) }
    it "ユーザー、食材、数量、期限があれば有効であること" do
      user_food = build(:user_food, user: user, food: food)
      expect(user_food).to be_valid
    end

    it "ユーザーがなければ、登録できないこと" do
      user_food = build(:user_food, user: nil, food: food)
      expect(user_food).to be_invalid
      expect(user_food.errors[:user_id]).to include("を入力してください")
    end

    it "食材がなければ、登録できないこと" do
      user_food = build(:user_food, user: user, food: nil)
      expect(user_food).to be_invalid
      expect(user_food.errors[:food_id]).to include("を入力してください")
    end

    it "数量は必須項目であること" do
      user_food = build(:user_food, user: user, food: food, quantity: nil)
      expect(user_food).to be_invalid
      expect(user_food.errors[:quantity]).to include("を入力してください")
    end

    it "数量は1～100の範囲内であること" do
      user_food_0 = build(:user_food, user: user, food: food, quantity: 0)
      user_food_101 = build(:user_food, user: user, food: food, quantity: 101)
      expect(user_food_0).to be_invalid
      expect(user_food_101).to be_invalid
      expect(user_food_0.errors[:quantity]).to include("は0より大きい値にしてください")
      expect(user_food_101.errors[:quantity]).to include("は100以下の値にしてください")
    end

    it "期限は必須項目であること" do
      user_food = build(:user_food, user: user, food: food, deadline_date: nil)
      expect(user_food).to be_invalid
      expect(user_food.errors[:deadline_date]).to include("を入力してください")
    end

    it "メモは50文字以内であること" do
      user_food = build(:user_food, user: user, food: food, mini_memo: "a" * 51)
      expect(user_food).to be_invalid
      expect(user_food.errors[:mini_memo]).to include("は50文字以内で入力してください")
    end
  end

  describe "アソシエーション" do
    let!(:character) { create(:character, stage_number: 0) }
    let!(:user) { create(:user) }
    let!(:category) { create(:category) }
    let!(:food) { create(:food, category: category) }
    let!(:user_food) { create(:user_food, user: user, food: food) }
    context "1対多" do
      it "複数の食材の行動履歴(FoodAction)を持てること" do
        food_action1 = create(:food_action, user: user, user_food: user_food)
        food_action2 = create(:food_action, user: user, user_food: user_food)
        expect(user_food.food_actions).to include(food_action1, food_action2)
      end
    end

    context "属していること" do
      it "ユーザーに属していること" do
        expect(user_food.user).to eq user
      end

      it "食材に属していること" do
        expect(user_food.food).to eq food
      end
    end
  end
end
