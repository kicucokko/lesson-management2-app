class UserRoom < ApplicationRecord
  belongs_to :user
  belongs_to :lesson_room
end
