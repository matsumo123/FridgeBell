require 'rails_helper'

RSpec.describe Favorite, type: :model do
  describe "バリデーション" do
    let!(:character) { create(:character, stage_number: 0) }
    let!(:user) { create(:user) }
    let!(:category) { create(:category) }
    let!(:food) { create(:food, category: category) }
    it "ユーザー、食材があれば有効であること" do
      favorite = build(:favorite, user: user, food: food)
      expect(favorite).to be_valid
    end

    it "ユーザーが未設定なら無効であること" do
      favorite = build(:favorite, user: nil, food: food)
      expect(favorite).to be_invalid
      expect(favorite.errors[:user]).to include("を入力してください")
    end

    it "食材が未設定なら無効であること" do
      favorite = build(:favorite, user: user, food: nil)
      expect(favorite).to be_invalid
      expect(favorite.errors[:food]).to include("を入力してください")
    end

    it "同じユーザーが同じ食材を重複して登録できないこと" do
      favorite = create(:favorite, user: user, food: food)
      favorite1 = build(:favorite, user: user, food: food)
      expect(favorite1).to be_invalid
      expect(favorite1.errors[:user_id]).to include("はすでに存在します")
    end
  end

  describe "アソシエーション" do
    let!(:character) { create(:character, stage_number: 0) }
    let!(:user) { create(:user) }
    let!(:category) { create(:category) }
    let!(:food) { create(:food, category: category) }
    it "ユーザーに属していること" do
      favorite = create(:favorite, user: user, food: food)
      expect(favorite.user).to eq user
    end

    it "食材に属していること" do
      favorite = create(:favorite, user: user, food: food)
      expect(favorite.food).to eq food
    end
  end
end
