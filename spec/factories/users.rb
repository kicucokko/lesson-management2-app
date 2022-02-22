FactoryBot.define do
  factory :user do
    role          {1}
    nickname      {Faker::Name.initials(number: 2)}
    email         {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 7)
    password      {password}
    password_confirmation {password}
    name          {"鈴木太郎"}
    name_kana     {"スズキタロウ"}
    birth_date    {"1990/01/01"}
    prefecture_id {2}
    city_block    {"札幌市札幌"}
    station       {"札幌駅"}

    after(:build) do |user|
      user.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
    end
  end
end
