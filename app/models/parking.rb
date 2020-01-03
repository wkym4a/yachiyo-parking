class Parking < ApplicationRecord
  belongs_to :user

  enum status:{
    has_empty: 0, #空きあり
    will_empty: 1, #空き予定
    no_empty: 9 #空き無し
  }


  ####↓↓↓↓バリデーション情報↓↓↓↓############
  validates :symbol, presence: true, length: { maximum: 2 }
  validates :name, presence: true, length: { maximum: 40 }
  validates :address, length: {maximum:255}
  validates :lat, numericality: {greater_than_or_equal_to: -90,less_than_or_equal_to: 90}
  validates :lon, numericality: {greater_than_or_equal_to: -180,less_than_or_equal_to: 180}
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 0,less_than_or_equal_to: 99999999}
  validates :memo, length: { maximum: 400 },on: :update
  validates :managing_memo, length: { maximum: 2000 },on: :update
  validates :number, presence: true, numericality: {greater_than_or_equal_to: 0,less_than_or_equal_to: 999}
  validates :empty_number, presence: true, numericality: {greater_than_or_equal_to: 0,less_than_or_equal_to: 999}
  ####↑↑↑↑バリデーション情報↑↑↑↑############
end
