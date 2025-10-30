require 'rails_helper'

RSpec.describe Reminder, type: :model do
  describe "バリデーション" do
    let!(:character) { create(:character, stage_number: 0) }
    let!(:user) { create(:user) }
    it "ユーザー、〇日前、リマインド時刻があれば有効であること" do
      reminder = build(:reminder, user: user)
      expect(reminder).to be_valid
    end

    it "ユーザーが未設定なら無効であること" do
      reminder = build(:reminder, user: nil)
      expect(reminder).to be_invalid
      expect(reminder.errors[:user]).to include("を入力してください")
    end

    it "同じユーザーが複数のリマインド設定を持てないこと" do
      create(:reminder, user: user)
      reminder = build(:reminder, user: user)
      expect(reminder).to be_invalid
      expect(reminder.errors[:user_id]).to include("はすでに存在します")
    end

    it "〇日前は必須項目であること" do
      reminder = build(:reminder, user: user, days_before: nil)
      expect(reminder).to be_invalid
      expect(reminder.errors[:days_before]).to include("を入力してください")
    end

    it "○日前は整数であること" do
      reminder = build(:reminder, user: user, days_before: 1.5)
      expect(reminder).to be_invalid
      expect(reminder.errors[:days_before]).to include("は整数で入力してください")
    end

    it "○日前は1~7の範囲内であること" do
      reminder_0 = build(:reminder, user: user, days_before: 0)
      reminder_8 = build(:reminder, user: user, days_before: 8)
      expect(reminder_0).to be_invalid
      expect(reminder_8).to be_invalid
      expect(reminder_0.errors[:days_before]).to include("は1以上の値にしてください")
      expect(reminder_8.errors[:days_before]).to include("は7以下の値にしてください")
    end

    it "リマインド時刻は必須項目であること" do
      reminder = build(:reminder, user: user, remind_time: nil)
      expect(reminder).to be_invalid
      expect(reminder.errors[:remind_time]).to include("を入力してください")
    end
  end

  describe "アソシエーション" do
    let!(:character) { create(:character, stage_number: 0) }
    let!(:user) { create(:user) }
    it "ユーザーに属していること" do
      reminder = create(:reminder, user: user)
      expect(reminder.user).to eq user
    end
  end
end
