require 'rails_helper'

RSpec.describe "UserFoods", type: :system do
  let!(:character) { create(:character, :with_image, stage_number: 0) }
  let(:user) { create(:user) }
  let!(:category) { create(:category) }
  let!(:food) { create(:food, category: category, name: "トマト") }

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

  describe "ログイン後" do
    before { login_as(user) }

    describe "ユーザー食材の新規登録" do
      context "フォームの入力値が正常" do
        it "ユーザー食材の新規作成が成功する" do
          visit new_user_food_path(category_id: category.id)
          find("button[data-action='click->counter#addition']", match: :first).click
          click_button "次へ"
          click_button "保存する"
          expect(page).to have_content "冷蔵庫に食材を登録しました"
        end
      end

      context "数量が未入力" do
        it "ユーザー食材の新規登録ができない(次へボタンがクリックできない)" do
          visit new_user_food_path(category_id: category.id)
          expect(page).to have_selector("button[data-action='click->counter#addition']")
          expect(page).to have_selector('[data-foods-selection-target="nextButton"][disabled]')
        end
      end
    end

    describe "ユーザー食材の編集" do
      let!(:user_food) { create(:user_food, user: user, food: food) }
      before { visit user_foods_path }

      context "フォームの入力が正常" do
        it "ユーザー食材の編集が成功する" do
          find("a[href='/user_foods/#{user_food.id}/edit']").click
          fill_in "数量", with: 5
          select "2025", from: "user_food[deadline_date(1i)]"
          select "11", from: "user_food[deadline_date(2i)]"
          select "30", from: "user_food[deadline_date(3i)]"
          click_button "更新"
          expect(page).to have_content "冷蔵庫の食材情報を更新しました"
          expect(current_path).to eq user_foods_path
        end
      end
    end

    describe "ユーザー食材の削除" do
      let!(:user_food) { create(:user_food, user: user, food: food) }

      it "ユーザー食材の削除に成功する" do
        visit user_foods_path
        find("a[href='/user_foods/#{user_food.id}']").click
        expect(page.accept_confirm).to eq "削除してよろしいですか"
        expect(page).to have_content "冷蔵庫から食材を削除しました"
        expect(current_path).to eq user_foods_path
        expect(page).not_to have_content user_food.food.name
      end
    end
  end
end
