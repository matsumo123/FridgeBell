require 'rails_helper'

RSpec.describe "UserFoods", type: :system do
  include LoginMacros

  before do
    driven_by(:rack_test)
  end

  let!(:character) { create(:character, :with_image, stage_number: 0) }
  let(:user) { create(:user) }
  let!(:category) { create(:category) }
  let!(:food) { create(:food, category: category) }

  describe "ログイン前" do
    describe "ページ遷移確認" do
      context "ユーザー食材の新規登録ページにアクセス" do
        it "新規登録ページへのアクセスが失敗する" do
          visit new_user_food_path
          expect(page).to have_content "ログインもしくはアカウント登録してください。"
          expect(current_path).to eq new_user_session_path
        end
      end

      context "ユーザー食材の編集ページにアクセス" do
        it "編集ページへのアクセスが失敗する" do
          visit edit_user_food_path(food)
          expect(page).to have_content "ログインもしくはアカウント登録してください。"
          expect(current_path).to eq new_user_session_path
        end
      end

      context "ユーザー食材の一覧ページにアクセス" do
        it "一覧ページへのアクセスが失敗する" do
          visit user_foods_path
          expect(page).to have_content "ログインもしくはアカウント登録してください。"
          expect(current_path).to eq new_user_session_path
        end
      end
    end
  end
end
