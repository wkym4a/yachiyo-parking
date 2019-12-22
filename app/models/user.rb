class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  ####↓↓↓↓アソシエーション情報↓↓↓↓############
  has_many :parkings , dependent: :destroy
  ####↑↑↑↑アソシエーション情報↑↑↑↑############
end
