class LessonRoom < ApplicationRecord
  has_many :user_rooms, dependent: :destroy
  has_many :users, through: :user_rooms
  has_many :reviews, dependent: :destroy

  validates :room_name, presence: true
end
