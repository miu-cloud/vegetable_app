FactoryBot.define do
    factory :user do
      name { "田中太郎" }
      email { 'tanaka@exsample.jp' }
      password { "000000" }
      password_confirmation { "000000" }
    end

    factory :second_user, class: User do
        name { "鈴木花子" }
        email { 'suzuki@exsample.jp' }
        password { "000000" }
        password_confirmation { "000000" }
    end
end