require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "バリデーションチェック" do
    it "カテゴリー名があれば有効であること" do
      category = build(:category)
      expect(category).to be_valid
    end

    it "カテゴリー名は必須項目であること" do
      category_without_name = build(:category, name: nil)
      category_without_name.valid?
      expect(category_without_name.errors[:name]).not_to be_empty
    end
  end

  describe "アソシエーション" do
    it "複数の食材を持てること" do
      category = create(:category)
      food1 = create(:food, category_id: category.id)
      food2 = create(:food, category_id: category.id)
      expect(category.foods).to include(food1, food2)
    end
  end

  describe "カテゴリーの表示順" do
    it "ORDERに含まれる名前が指定通りの順になること" do
      Category::ORDER.each do |name|
        create(:category, name: name)
      end
      expect(Category.custom_order.map(&:name)).to eq Category::ORDER
    end

    it "ORDERにない名前は末尾に回ること" do
      Category::ORDER.each do |name|
        create(:category, name: name)
      end
      no_order_category = create(:category, name: "魚")
      expect(Category.custom_order.map(&:name)).to eq Category::ORDER + [ "魚" ]
    end
  end
end
