class Review < ApplicationRecord
  belongs_to :user
  belongs_to :lesson_room
end
