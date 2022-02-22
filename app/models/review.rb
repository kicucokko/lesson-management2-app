class Review < ApplicationRecord
  belongs_to :user
  belongs_to :lesson_room
  has_one_attached :image
end
