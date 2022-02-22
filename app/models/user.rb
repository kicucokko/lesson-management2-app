class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: { admin: 1, customer: 2 }
  with_options presence: true do
    validates :role
    validates :nickname
    validates :name
    validates :name_kana ,format: { with:/\A[ァ-ヶー－]+\z/,message: 'は全角カタカナで入力してください' }
    validates :birth_date
    validates :prefecture_id,numericality: { other_than: 1,message: 'を選択してください'} 
    validates :city_block
    validates :image
  end
  has_many :user_roles
  has_many :roles, through: :user_roles
  has_many :user_rooms
  has_many :lesson_rooms, through: :user_rooms
  has_many :reviews
  has_many :calenders
  has_many :purchases

  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions 
  belongs_to :prefecture
end
