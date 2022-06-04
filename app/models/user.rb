class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :avatar
  has_one_attached :banner
  has_many :activities
  has_many :reservations
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
