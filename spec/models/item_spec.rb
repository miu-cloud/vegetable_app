require 'rails_helper'
RSpec.describe Item, type: :model do
    describe 'アイテムモデル機能', type: :model do

        before do
          @user = FactoryBot.create(:user)
        end
        
        describe 'バリデーションのテスト' do
            context 'アイテムのタイトルが空の場合' do
            it "バリデーションに引っかかる" do
                item = Item.new(title:'', content:'傷があります',count: 2, place:'公園', promise_at:'002022-05-05-10:00', state:'可', image:'public/images/トマト.jpeg', user_id: @user.id )
                expect(item).not_to be_valid
            end
            end
            context 'アイテムの内容が空の場合' do
                it "バリデーションに引っかかる" do
                item = Item.new(title:'トマト', content:'',count: 2, place:'公園', promise_at:'002022-05-05-10:00', state:'可', image:'public/images/トマト.jpeg', user_id: @user.id )
                expect(item).not_to be_valid
                end
            end
            context 'アイテムの数量が空の場合' do
                it "バリデーションに引っかかる" do
                item = Item.new(title:'トマト', content:'傷があります',count:'', place:'公園', promise_at:'002022-05-05-10:00', state:'可', image:'public/images/トマト.jpeg', user_id: @user.id )
                expect(item).not_to be_valid
                end
            end
            context 'アイテムの譲渡場所が空の場合' do
                it "バリデーションに引っかかる" do
                item = Item.new(title:'トマト', content:'傷があります',count: 2, place:'', promise_at:'002022-05-05-10:00', state:'可', image:'public/images/トマト.jpeg', user_id: @user.id )
                expect(item).not_to be_valid
                end
            end
            context 'アイテムの時間が空の場合' do
                it "バリデーションに引っかかる" do
                item = Item.new(title:'トマト', content:'傷があります',count: 2, place:'公園', promise_at:'', state:'可', image:'public/images/トマト.jpeg', user_id: @user.id )
                expect(item).not_to be_valid
                end
            end
            context 'アイテムの受付状態が空の場合' do
                it "バリデーションに引っかかる" do
                item = Item.new(title:'トマト', content:'傷があります',count: 2, place:'公園', promise_at:'002022-05-05-10:00', state:'', image:'public/images/トマト.jpeg', user_id: @user.id )
                expect(item).not_to be_valid
                end
            end
            context 'アイテムの画像が空の場合' do
                it "バリデーションに引っかかる" do
                item = Item.new(title:'トマト', content:'傷があります',count: 2, place:'公園', promise_at:'002022-05-05-10:00', state:'可', image:'', user_id: @user.id )
                expect(item).not_to be_valid
                end
            end
            context 'アイテムが全て入力されている場合' do
                it "バリデーションが通る" do
                    item = Item.new(title:'トマト', content:'傷があります',count: 2, place: '公園', promise_at: '002022-05-05-10:00', state: '可', image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/tomato.jpeg')), user_id: @user.id )
                    expect(item).to be_valid
                end
            end
        end
    end
end