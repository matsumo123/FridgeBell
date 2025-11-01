require 'rails_helper'

RSpec.describe "Users", type: :system do
  let!(:character) { create(:character, :with_image, stage_number: 0) }
  let(:user) { create(:user) }

  describe "ログイン前" do
    describe "ユーザー新規登録" do
      context "フォームの入力値が正常" do
        it "ユーザーの新規作成が成功する" do
          visit new_user_registration_path
          fill_in "ユーザー名", with: "ユーザー"
          fill_in "メールアドレス", with: "user@example.com"
          fill_in "パスワード", with: "Password1234"
          fill_in "パスワード(確認用)", with: "Password1234"
          click_button "登録"
          expect(page).to have_content "アカウント登録が完了しました。"
          expect(current_path).to eq home_path
        end
      end

      context "ユーザー名が未入力" do
        it "ユーザーの新規作成が失敗する" do
          visit new_user_registration_path
          fill_in "ユーザー名", with: ""
          fill_in "メールアドレス", with: "user@example.com"
          fill_in "パスワード", with: "Password1234"
          fill_in "パスワード(確認用)", with: "Password1234"
          click_button "登録"
          expect(page).to have_content "ユーザー名を入力してください"
          expect(current_path).to eq new_user_registration_path
        end
      end

      context "メールアドレスが未入力" do
        it "ユーザーの新規作成が失敗する" do
          visit new_user_registration_path
          fill_in "ユーザー名", with: "ユーザー"
          fill_in "メールアドレス", with: ""
          fill_in "パスワード", with: "Password1234"
          fill_in "パスワード(確認用)", with: "Password1234"
          click_button "登録"
          expect(page).to have_content "メールアドレスを入力してください"
          expect(current_path).to eq new_user_registration_path
        end
      end

      context "登録済みのメールアドレスを使用" do
        it "ユーザーの新規作成が失敗する" do
          user = create(:user)
          visit new_user_registration_path
          fill_in "ユーザー名", with: "ユーザー"
          fill_in "メールアドレス", with: user.email
          fill_in "パスワード", with: "Password1234"
          fill_in "パスワード(確認用)", with: "Password1234"
          click_button "登録"
          expect(page).to have_content "メールアドレスはすでに存在します"
          expect(current_path).to eq new_user_registration_path
          expect(page).to have_field "メールアドレス", with: user.email
        end
      end
    end

    describe "マイページ" do
      context "ログインしていない状態" do
        it "マイページへのアクセスが失敗する" do
          visit users_profile_path
          expect(page).to have_content "ログインもしくはアカウント登録してください。"
          expect(current_path).to eq new_user_session_path
        end
      end
    end
  end

  describe "ログイン後" do
    before { login_as(user) }

    describe "ユーザー編集" do
      context "フォームの入力が正常" do
        it "ユーザーの編集が成功する" do
          visit edit_user_registration_path
          fill_in "ユーザー名", with: "ユーザー更新"
          fill_in "メールアドレス", with: "update@example.com"
          click_button "更新"
          expect(page).to have_content "アカウント情報を変更しました。"
          expect(current_path).to eq users_profile_path
        end
      end

      context "ユーザー名が未入力" do
        it "ユーザーの編集が失敗する" do
          visit edit_user_registration_path
          fill_in "ユーザー名", with: ""
          fill_in "メールアドレス", with: "update@example.com"
          click_button "更新"
          expect(page).to have_content "ユーザー名を入力してください"
          expect(current_path).to eq edit_user_registration_path
        end
      end

      context "メールアドレスが未入力" do
        it "ユーザーの編集が失敗する" do
          visit edit_user_registration_path
          fill_in "ユーザー名", with: "ユーザー更新"
          fill_in "メールアドレス", with: ""
          click_button "更新"
          expect(page).to have_content "メールアドレスを入力してください"
          expect(current_path).to eq edit_user_registration_path
        end
      end

      context "登録済みのメールアドレスを使用" do
        it "ユーザーの編集が失敗する" do
          visit edit_user_registration_path
          existed_user = create(:user)
          fill_in "ユーザー名", with: "ユーザー更新"
          fill_in "メールアドレス", with: existed_user.email
          click_button "更新"
          expect(page).to have_content "メールアドレスはすでに存在します"
          expect(current_path).to eq edit_user_registration_path
        end
      end
    end
  end
end
