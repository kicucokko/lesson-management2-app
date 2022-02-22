FactoryBot.define do
  factory :review do
    time       {"2022/01/01"}
    title      {"Test"} 
    text       {"aaaaaaa"}
    home_work  {"aaaaaaa"}
    information{"aaaaaaa"}

    association :user
    association :lesson_room
    
    after(:build) do |review|
      review.image.attach(io: File.open('public/test_image.png'), filename:'test_image.png')
    end
  end
end
