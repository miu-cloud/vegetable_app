require 'rails_helper'
RSpec.describe User, type: :model do
    describe 'ユーザモデル機能', type: :model do

        describe 'バリデーションのテスト' do
            context '全て正しく入力されている場合' do
                it "新規登録ができる" do
                    user = User.new(
                        name: "田中太郎",
                        email: "tanaka@exsample.com",
                        password: "000000",
                        password_confirmation: "000000"
                        )
                        expect(user).to be_valid
                end
            end
        end
        describe 'バリデーションのテスト' do
            context '名前が未入力の場合' do
                it "バリデーションに引っかかる" do
                    user = User.new(
                        name: "",
                        email: "tanaka@exsample.com",
                        password: "00000",
                        password_confirmation: "00000"
                        )
                        expect(user).not_to be_valid
                end
            end
        end
        describe 'バリデーションのテスト' do
            context 'メールアドレスが未入力の場合' do
                it "バリデーションに引っかかる" do
                    user = User.new(
                        name: "田中太郎",
                        email: "",
                        password: "00000",
                        password_confirmation: "00000"
                        )
                        expect(user).not_to be_valid
                end
            end
        end
        describe 'バリデーションのテスト' do
            context 'パスワードが未入力の場合' do
                it "バリデーションに引っかかる" do
                    user = User.new(
                        name: "田中太郎",
                        email: "tanaka@exsample.com",
                        password: "",
                        password_confirmation: "00000"
                        )
                        expect(user).not_to be_valid
                end
            end
        end
        describe 'バリデーションのテスト' do
            context '確認用パスワードが6文字以下の場合' do
                it "バリデーションに引っかかる" do
                    user = User.new(
                        name: "田中太郎",
                        email: "tanaka@exsample.com",
                        password: "00000",
                        password_confirmation: ""
                        )
                        expect(user).not_to be_valid
                end
            end
        end
    end
end

    