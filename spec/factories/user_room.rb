FactoryBot.define do
  factory :user_room do
    association :user
    association :lesson_room
  end
end