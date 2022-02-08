class UserRoom < ApplicationRecord
  belongs_to :lesson_room
  belongs_to :user
end
