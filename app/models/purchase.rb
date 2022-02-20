class Purchase < ApplicationRecord
  attr_accessor :token
  belongs_to :user

  validates :price, presence: true
  validates :token, presence: true

end
