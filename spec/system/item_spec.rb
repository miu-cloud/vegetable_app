require 'rails_helper'
RSpec.describe '投稿機能', type: :system do
  user = FactoryBot.create(:user)
  

  def login(user)
    visit user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    find('#login').click
  end

  describe '新規投稿機能' do
    context '新規投稿をした場合' do
        it '投稿した一覧が表示される' do
            login(user)
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
            expect(page).to have_content 'トマト'
            expect(page).to have_content '規格外品です'
            expect(page).to have_content '3'
            expect(page).to have_content '公園'
            expect(page).to have_content '2022-05-05 05:00'
            expect(page).to have_content '可'
            expect(page).to have_content '3'
        end
        it '投稿の編集ができる' do
            login(user)
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
            visit items_path
            click_link '編集'
            fill_in 'item[title]', with: 'トマト'
            fill_in 'item[content]', with: '傷があります'
            fill_in 'item[count]', with: '3'
            fill_in 'item[place]', with: '公園'
            fill_in 'item[promise_at]', with: '002022-04-04-04:00'
            select '可', from: :item_state
            image_path = Rails.root.join('public/images/トマト.jpeg')
            attach_file('item[image]', image_path, make_visible: true)
            click_on '変更'
            expect(page).to have_content '傷があります'
            expect(page).to have_content '2022-04-04 04:00'
        end
        it '投稿の削除ができる' do
            login(user)
            visit new_item_path
            fill_in 'item[title]', with: 'トマト'
            fill_in 'item[content]', with: '規格外品です'
            fill_in 'item[count]', with: '3'
            fill_in 'item[place]', with: '公園'
            fill_in 'item[promise_at]', with: '002022-05-05-05:00'
            select '可', from: :item_state
            image_path = Rails.root.join('public/images/トマト.jpeg')
            attach_file('item[image]', image_path, make_visible: true)
            click_on '投稿'
            visit items_path
            click_link '削除'
            page.driver.browser.switch_to.alert.accept
            expect(page).to have_content '投稿を削除しました！'
        end
    end
end
    describe '投稿一覧機能' do
        context '他のユーザが投稿をしている場合' do
            it '投稿した一覧が表示される' do
            #投稿するユーザ
            login(user)
            # binding.pry
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
            expect(page).to have_content 'トマト'
            expect(page).to have_content '規格外品です'
            expect(page).to have_content '3'
            expect(page).to have_content '公園'
            expect(page).to have_content '2022-05-05 05:00'
            expect(page).to have_content '可'
            expect(page).to have_content '3'
            click_on 'ログアウト'
            #投稿を閲覧するユーザ
            FactoryBot.create(:second_user)
            visit user_session_path
            fill_in 'user[email]', with: 'suzuki@exsample.jp'
            fill_in 'user[password]', with: '000000'
            find('#login').click
            visit items_path
            expect(page).to have_content 'トマト'
            expect(page).to have_content '規格外品です'
            expect(page).to have_content '3'
            expect(page).to have_content '公園'
            expect(page).to have_content '2022-05-05 05:00'
            expect(page).to have_content '可'
            expect(page).to have_content '3'
        end
        it 'ユーザにメッセージを送るをクリックするとそのユーザの詳細ページへ遷移' do
            #投稿するユーザ
            login(user)
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
            expect(page).to have_content 'トマト'
            expect(page).to have_content '規格外品です'
            expect(page).to have_content '3'
            expect(page).to have_content '公園'
            expect(page).to have_content '2022-05-05 05:00'
            expect(page).to have_content '可'
            expect(page).to have_content '3'
            click_on 'ログアウト'
            #投稿を閲覧するユーザ
            FactoryBot.create(:second_user)
            visit user_session_path
            fill_in 'user[email]', with: 'suzuki@exsample.jp'
            fill_in 'user[password]', with: '000000'
            find('#login').click
            visit items_path
            click_link '田中太郎'   
            expect(page).to have_content '田中太郎'
            expect(page).to have_content 'トマト'
            expect(page).to have_content '規格外品です'
        end
      end
   end

   describe '検索機能' do
    context 'タイトルであいまい検索をした場合' do
        it '検索キーワードを含むものが絞り込まれる' do
            #userでキュウリとトマトの２つを投稿
            login(user)
            visit new_item_path
            fill_in 'item[title]', with: 'トマト'
            fill_in 'item[content]', with: '規格外品です'
            fill_in 'item[count]', with: '3'
            fill_in 'item[place]', with: '公園'
            fill_in 'item[promise_at]', with: '002022-05-05-05:00'
            select '可', from: :item_state
            image_path = Rails.root.join('public/images/トマト.jpeg')
            attach_file('item[image]', image_path, make_visible: true)
            click_on '投稿'
            visit new_item_path
            fill_in 'item[title]', with: 'キュウリ'
            fill_in 'item[content]', with: '傷があります'
            fill_in 'item[count]', with: '2'
            fill_in 'item[place]', with: '駅前'
            fill_in 'item[promise_at]', with: '002022-05-05-05:00'
            select '可', from: :item_state
            image_path = Rails.root.join('public/images/きゅうり.jpeg')
            attach_file('item[image]', image_path, make_visible: true)
            click_on '投稿'
            visit items_path
            #検索
            fill_in 'q[title_cont]' , with: 'キュウリ'
            click_on '検索'
            expect(page).to have_content 'キュウリ'
            expect(page).to have_content '傷があります'
        end
    end
   end

end
    