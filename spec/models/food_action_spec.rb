require 'rails_helper'

RSpec.describe FoodAction, type: :model do
  describe "バリデーション" do
    let!(:character) { create(:character, stage_number: 0) }
    let!(:user) { create(:user) }
    it "必須属性が揃っていれば有効であること(user, action_type, action_date, quantity, availability)" do
      food_action = build(:food_action, user: user)
      expect(food_action).to be_valid
    end

    it "ユーザーが未設定なら無効であること" do
      food_action = build(:food_action, user: nil)
      expect(food_action).to be_invalid
      expect(food_action.errors[:user]).to include("を入力してください")
    end

    it "種別(action_type)は必須項目であること" do
      food_action = build(:food_action, user: user, action_type: nil)
      expect(food_action).to be_invalid
      expect(food_action.errors[:action_type]).to include("を入力してください")
    end

    it "種別(action_type)はconsumed/discarded以外の値は無効であること" do
      food_action = build(:food_action, user: user, action_type: "a")
      expect(food_action).to be_invalid
      expect(food_action.errors[:action_type]).to include("は一覧にありません")
    end

    it "消費・廃棄した日(action_date)は必須項目であること" do
      food_action = build(:food_action, user: user, action_date: nil)
      expect(food_action).to be_invalid
      expect(food_action.errors[:action_date]).to include("を入力してください")
    end

    it "数量は必須項目であること" do
      food_action = build(:food_action, user: user, quantity: nil)
      expect(food_action).to be_invalid
      expect(food_action.errors[:quantity]).to include("を入力してください")
    end

    it "数量は1～100の範囲内であること" do
      food_action_1 = build(:food_action, user: user, quantity: 0)
      food_action_101 = build(:food_action, user: user, quantity: 101)
      expect(food_action_1).to be_invalid
      expect(food_action_101).to be_invalid
      expect(food_action_1.errors[:quantity]).to include("は0より大きい値にしてください")
      expect(food_action_101.errors[:quantity]).to include("は100以下の値にしてください")
    end

    it "availabilityはtrue/falseのみ有効、nilは無効であること" do
      food_action = build(:food_action, user: user, availability: true)
      food_action_nil = build(:food_action, user: user, availability: nil)
      expect(food_action).to be_valid
      expect(food_action_nil).to be_invalid
    end

    it "食材名は15文字以内であること" do
      food_action = build(:food_action, user: user, food_name: "a" * 16)
      expect(food_action).to be_invalid
      expect(food_action.errors[:food_name]).to include("は15文字以内で入力してください")
    end

    it "単位は5文字以内であること" do
      food_action = build(:food_action, user: user, unit: "a" * 6)
      expect(food_action).to be_invalid
      expect(food_action.errors[:unit]).to include("は5文字以内で入力してください")
    end

    context "スナップショット" do
      let!(:category) { create(:category) }
      let!(:food) { create(:food, category: category) }
      let(:user_food) { create(:user_food, user: user, food: food) }
      it "user_foodがある場合、food.nameとfood.unitがfood_name/unitにコピーされること" do
        uf = user_food
        food_action = create(:food_action, user_food: uf)
        expect(food_action.food_name).to eq uf.food.name
        expect(food_action.unit).to eq uf.food.unit
      end

      it "user_foodがない、またはfoodが未設定でも、food_nameは「不明」、unitは「個」に補完されること" do
        food_action = create(:food_action, user_food: nil)
        expect(food_action.food_name).to eq("不明")
        expect(food_action.unit).to eq("個")
      end
    end
  end

  describe "アソシエーション" do
    let!(:character) { create(:character, stage_number: 0) }
    let!(:user) { create(:user) }
    it "ユーザーに属していること" do
      food_action = create(:food_action, user: user)
      expect(food_action.user).to eq user
    end

    it "user_foodと関連付けられること" do
      category = create(:category)
      food = create(:food, category: category)
      user_food = create(:user_food, user: user, food: food)
      food_action = create(:food_action, user: user, user_food: user_food)
      expect(food_action.user_food).to eq user_food
    end
  end
end
