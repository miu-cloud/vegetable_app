FactoryBot.define do
    factory :item do
      title { "トマト" }
      content { '傷があります' }
      count { "2" }
      place { "駅" }
      promise_at { "002021-05-05 10:00" }
      state { "可" }
      image { "public/images/トマト.jpeg" }
    end
end