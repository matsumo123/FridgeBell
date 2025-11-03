require 'rails_helper'

RSpec.describe "FoodActions", type: :system do
  let!(:character) { create(:character, :with_image, stage_number: 0) }
  let!(:character1) { create(:character, :with_image, stage_number: 1) }
  let!(:user) { create(:user) }
  let!(:category) { create(:category) }
  let!(:food) { create(:food, category: category, name: "トマト") }
  let!(:user_food) { create(:user_food, user: user, food: food) }

  describe "ログイン前" do

    describe "ページ遷移確認" do
      it "消費登録ページへのアクセスが失敗する" do
        visit new_food_actions_consume_path
        expect(page).to have_content "ログインもしくはアカウント登録してください。"
        expect(current_path).to eq new_user_session_path
      end

      it "廃棄登録ページへのアクセスが失敗する" do
        visit new_food_actions_discard_path
        expect(page).to have_content "ログインもしくはアカウント登録してください。"
        expect(current_path).to eq new_user_session_path
      end
    end
  end

  describe "ログイン後" do
    before { login_as(user) }

    describe "消費登録" do
      context "フォームの入力が正常" do
        it "消費登録が成功する" do
          visit new_food_actions_consume_path
          within('form[action="/food_actions/consume"]') do
            find('input[type="checkbox"]', match: :first).set(true)
            expect(first('input[type="checkbox"]')).to be_checked
            click_button "登録"
          end
          expect(page).to have_current_path(home_path, wait: 5)
          expect(page).to have_content "食べた食材を登録しました"
        end
      end

      context "食材を選択していない場合" do
        it "消費登録が失敗する" do
          visit new_food_actions_consume_path
          click_button "登録"
          expect(page).to have_content "食材を1つ以上選択してください"
          expect(current_path).to eq new_food_actions_consume_path
        end
      end
    end
    
    describe "廃棄登録" do
      context "フォームの入力が正常" do
        it "廃棄登録が成功する" do
          visit new_food_actions_discard_path
          within('form[action="/food_actions/discard"]') do
            find('input[type="checkbox"]', match: :first).set(true)
            expect(first('input[type="checkbox"]')).to be_checked
            click_button "登録"
          end
          expect(page).to have_current_path(home_path, wait: 5)
          expect(page).to have_content "廃棄した食材を登録しました"
        end
      end

      context "食材を選択していない場合" do
        it "廃棄登録が失敗する" do
          visit new_food_actions_discard_path
          click_button "登録"
          expect(page).to have_content "食材を1つ以上選択してください"
          expect(current_path).to eq new_food_actions_discard_path
        end
      end
    end
  end
end
