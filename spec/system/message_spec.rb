require 'rails_helper'
RSpec.describe 'メッセージ機能', type: :system do

  describe 'メッセージ機能' do
    context 'メッセージを送った場合' do
      it '相手にメッセージが届く' do
        #まず新規投稿させる田中太郎に
        FactoryBot.create(:user)
        visit user_session_path
        fill_in 'user[email]', with: 'tanaka@exsample.jp'
        fill_in 'user[password]', with: '000000'
        find('#login').click
        visit new_item_path
        fill_in 'item[title]', with: 'トマト'
        fill_in 'item[content]', with: '規格外品です'
        fill_in 'item[count]', with: '3'
        fill_in 'item[place]', with: '公園'
        fill_in 'item[promise_at]', with: '002022-05-05-05:00'
        select '可', from: :item_state
        image_path = Rails.root.join('public/images/トマト.jpeg')
        attach_file('item[image]', image_path, make_visible: true)
        expect(page).to have_content 'マイページ'
        click_on '投稿'
        click_on 'ログアウト'
        
        #鈴木花子でログインさせる
        FactoryBot.create(:second_user)
        visit user_session_path
        fill_in 'user[email]', with: 'suzuki@exsample.jp'
        fill_in 'user[password]', with: '000000'
        find('#login').click
        visit items_path
        click_link 'このユーザにメッセージを送る'
        click_link 'メッセージを開始する'
        fill_in 'message[body]', with: '届いてますか？'   
        click_on 'メッセージを送る'
        click_on 'ログアウト'

        #再度田中太郎でログインさせる
        visit user_session_path
        fill_in 'user[email]', with: 'tanaka@exsample.jp'
        fill_in 'user[password]', with: '000000'
        find('#login').click
        click_link 'メッセージ'
        click_link '鈴木花子'
        expect(page).to have_content '届いてますか？'
      end
    end
  end
end