require 'rails_helper'

RSpec.describe Food, type: :model do
  describe "バリデーション" do
    let!(:category) { create(:category) }
    let!(:character) { create(:character, stage_number: 0) }
    context "通常のバリデーション" do
      it "カテゴリー、食材名、数量、単位があれば有効であること" do
        food = build(:food, category: category)
        expect(food).to be_valid
      end

      it "カテゴリーが未設定なら無効であること" do
        food = build(:food, category_id: nil)
        expect(food).to be_invalid
        expect(food.errors[:category]).to include("を入力してください")
      end

      it "食材名は必須項目であること" do
        food = build(:food, name: nil)
        expect(food).to be_invalid
        expect(food.errors[:name]).to include("を入力してください")
      end

      it "食材名は15文字以内であること" do
        food = build(:food, name: "a" * 16)
        expect(food).to be_invalid
        expect(food.errors[:name]).to include("は15文字以内で入力してください")
      end

      it "1カウントあたりの数量は必須項目であること" do
        food = build(:food, quantity: nil)
        expect(food).to be_invalid
        expect(food.errors[:quantity]).to include("を入力してください")
      end

      it "1カウントあたりの数量は1～100の範囲内であること" do
        food_1 = build(:food, quantity: 0)
        food_101 = build(:food, quantity: 101)
        expect(food_1).to be_invalid
        expect(food_101).to be_invalid
        expect(food_1.errors[:quantity]).to include("は0より大きい値にしてください")
        expect(food_101.errors[:quantity]).to include("は100以下の値にしてください")
      end

      it "1カウントあたりの単位は必須項目であること" do
        food = build(:food, unit: nil)
        expect(food).to be_invalid
        expect(food.errors[:unit]).to include("を入力してください")
      end

      it "1カウントあたりの単位は5文字以内であること" do
        food = build(:food, unit: "a" * 6)
        expect(food).to be_invalid
        expect(food.errors[:unit]).to include("は5文字以内で入力してください")
      end

      it "デフォルト期限は整数であること" do
        food = build(:food, default_deadline: 1.5)
        expect(food).to be_invalid
        expect(food.errors[:default_deadline]).to include("は整数で入力してください")
      end
    end

    context "ユーザー登録食材のバリデーション" do
      let!(:user) { create(:user) }
      it "同一ユーザーが同じ食材名を登録できないこと" do
        food1 = create(:food, category: category, user_id: user.id)
        food2 = build(:food, category: category, user_id: user.id)
        food2.name = food1.name
        expect(food2).to be_invalid
        expect(food2.errors[:name]).to include("はすでに登録済みです")
      end

      it "別ユーザーであれば同じ食材名でも登録できること" do
        user1 = create(:user)
        food1 = create(:food, category: category, user_id: user.id)
        food2 = build(:food, category: category, user_id: user1.id)
        food2.name = food1.name
        expect(food2).to be_valid
      end
    end

    context "デフォルト食材のバリデーション" do
      let!(:user) { create(:user) }
      it "デフォルトで登録されている食材は重複して登録できないこと" do
        default_food = create(:food, category: category)
        same_food = build(:food, category: category)
        same_food.name = default_food.name
        expect(same_food).to be_invalid
        expect(same_food.errors[:name]).to include("はすでに登録済みです")
      end

      it "ユーザーはデフォルトで登録されている食材名は登録できないこと" do
        default_food = create(:food, category: category)
        food = build(:food, category: category, user_id: user.id)
        food.name = default_food.name
        expect(food).to be_invalid
        expect(food.errors[:name]).to include("はすでに標準の食材リストに存在しています")
      end
    end
  end

  describe "アソシエーション" do
    let!(:category) { create(:category) }
    let!(:food) { create(:food, category: category) }
    let!(:character) { create(:character, stage_number: 0) }
    let!(:user) { create(:user) }
    context "1対多" do
      it "複数のユーザー食材を持てること" do
        user_food1 = create(:user_food, food: food, user: user)
        user_food2 = create(:user_food, food: food, user: user)
        expect(food.user_foods).to include(user_food1, user_food2)
      end

      it "複数のお気に入りを持てること" do
        favorite1 = create(:favorite, food: food)
        favorite2 = create(:favorite, food: food)
        expect(food.favorites).to include(favorite1, favorite2)
      end
    end

    context "属していること" do
      it "カテゴリーに属していること" do
        expect(food.category).to eq category
      end
    end
  end
end
