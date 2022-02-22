class Review < ApplicationRecord
  belongs_to :user
  belongs_to :lesson_room
  has_one_attached :image

  with_options presence: true do
    validates :time
    validates :title
    validates :text
  end
end
