FactoryBot.define do
    factory :user do
      name { "田中太郎" }
      sequence(:email) { 'tanaka@exsample.jp' }
      password { "000000" }
    end
  end