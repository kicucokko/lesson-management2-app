class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  with_options presence: true do
    validates :nickname
    validates :name
    validates :name_kana
    validates :birth_date
    validates :prefecture_id
    validates :city_block
  end
  has_many :user_roles
  has_many :roles, through: :user_roles
  has_many :user_rooms
  has_many :lesson_rooms, through: :user_rooms
  has_many :reviews
  extend ActiveHash::Associations::ActiveRecordExtensions 
  belongs_to :prefecture
end
