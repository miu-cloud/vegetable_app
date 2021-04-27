10.times do |n|
    User.create!(
      email: "test#{n + 1}@test.com",
      name: "田中太郎#{n + 1}",
      password: "000000"
    )
end

5.times do |n|
    Item.create!(
      user_id: User.first.id + n, 
      title: "トマト",
      content: "規格外品です#{n + 1}",
      count: 1,
      place: "公園#{n + 1}",
      promise_at: Date.today,
      state: "可",
      image: File.open('./app/assets/images/トマト.jpeg')
    )
end

5.times do |n|
    Item.create!(
      user_id: User.ids[5]+ n, 
      title: "キュウリ",
      content: "規格外品です#{n + 1}",
      count: 2,
      place: "駅前#{n + 1}",
      promise_at: Date.today.since(1.weeks),
      state: "可",
      image: File.open('./app/assets/images/きゅうり.jpeg')
    )
end