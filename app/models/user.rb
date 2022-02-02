class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_roles
  has_many :roles, through: :user_roles
  has_many :user_rooms
  has_many :lesson_rooms, through: :user_rooms
  
  
  with_options presence: true do
    validates :nickname, presence: true
    validates :name
    validates :name_kana
    validates :birth_date
    validates :prefecture_id
    validates :city_block
  end
  extend ActiveHash::Associations::ActiveRecordExtensions 
  belongs_to :prefecture
end
