require 'rails_helper'
RSpec.describe 'ログイン機能', type: :system do

  describe 'ユーザ登録機能' do
    context 'ユーザを新規登録した場合' do
      it 'ユーザのマイページが表示される' do
        visit new_user_registration_path
        fill_in 'user[name]', with: '田中太郎'
        fill_in 'user[email]', with: 'test@test.com'
        fill_in 'user[password]', with: '000000'
        fill_in 'user[password_confirmation]', with: '000000'
        # 同ページに新規登録ボタンとリンクが２つ以上あるため、ビューの方にid:"newaccount"を持たせ、下記のように記入
        find('#newaccount').click
        expect(page).to have_content 'マイページ'
      end
    end

    context 'ログインせずにマイページへアクセスした場合' do
        it 'ログイン画面に遷移する' do
          visit mypage_path
          expect(page).to have_content 'アカウント登録もしくはログインしてください。'
        end
    end
  end
  describe 'セッション機能' do
    context 'ユーザが登録されている場合' do
        it 'ログインができる' do
            FactoryBot.create(:user)
            visit user_session_path
            fill_in 'user[email]', with: 'tanaka@exsample.jp'
            fill_in 'user[password]', with: '000000'
            # 同ページに新規登録ボタンとリンクが２つ以上あるため、ビューの方にid:"login"を持たせ、下記のように記入
            find('#login').click
            expect(page).to have_content 'マイページ'
        end
    context 'ログインしている場合' do
        it 'ログアウトができる' do
            FactoryBot.create(:user)
            visit user_session_path
            fill_in 'user[email]', with: 'tanaka@exsample.jp'
            fill_in 'user[password]', with: '000000'
            find('#login').click
            click_link 'ログアウト'
            expect(page).to have_content 'ログアウトしました。'
        end
    end
   end
  end 

  describe 'マイページ機能' do
    context 'ログインしている場合' do
        it 'ユーザの詳細画面に遷移する' do
            FactoryBot.create(:user)
            visit user_session_path
            fill_in 'user[email]', with: 'tanaka@exsample.jp'
            fill_in 'user[password]', with: '000000'
            find('#login').click
            click_link '田中太郎'
            expect(page).to have_content 'ユーザの詳細'
        end

        it 'もらうをクリックすると投稿一覧画面に遷移する' do
            FactoryBot.create(:user)
            visit user_session_path
            fill_in 'user[email]', with: 'tanaka@exsample.jp'
            fill_in 'user[password]', with: '000000'
            find('#login').click
            click_link 'もらう'
            expect(page).to have_content '投稿一覧画面'
        end

        it 'ゆずるをクリックすると新規投稿画面に遷移する' do
            FactoryBot.create(:user)
            visit user_session_path
            fill_in 'user[email]', with: 'tanaka@exsample.jp'
            fill_in 'user[password]', with: '000000'
            find('#login').click
            click_link 'ゆずる'
            expect(page).to have_content '新規投稿'
        end
    end
  end 

  describe 'ユーザ編集機能' do
    context 'ログインしている場合' do
        it 'ユーザを編集できる' do
            FactoryBot.create(:user)
            visit user_session_path
            fill_in 'user[email]', with: 'tanaka@exsample.jp'
            fill_in 'user[password]', with: '000000'
            find('#login').click
            click_link '田中太郎'
            click_link '編集'
            click_on '編集'
            expect(page).to have_content 'ユーザを更新しました！'
        end
    end
  end
end