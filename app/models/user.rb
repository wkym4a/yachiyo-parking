class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  ####↓↓↓↓アソシエーション情報↓↓↓↓############
  has_many :parkings , dependent: :destroy
  ####↑↑↑↑アソシエーション情報↑↑↑↑############


  ####↓↓↓↓バリデーション情報↓↓↓↓############
  validates :name, presence: true, length: { maximum: 40 },on: :update
  validates :lat, numericality: {greater_than_or_equal_to: -90,less_than_or_equal_to: 90},on: :update
  validates :lon, numericality: {greater_than_or_equal_to: -180,less_than_or_equal_to: 180},on: :update
  validates :address, length: {maximum:255},on: :update
  validates :url, length: {maximum:4096},on: :update
  validates :tel, length: {maximum:20},on: :update
  validates :fax, length: {maximum:20},on: :update
  validates :memo, length: {maximum:400},on: :update
  ####↑↑↑↑バリデーション情報↑↑↑↑############


end
