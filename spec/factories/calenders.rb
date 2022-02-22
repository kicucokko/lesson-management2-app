FactoryBot.define do
  factory :calender do
    day     {Faker::Date.forward(days: 23)} 
    time    {"19:00"}

    association :user
  end
end
