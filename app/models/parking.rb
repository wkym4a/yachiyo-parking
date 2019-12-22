class Parking < ApplicationRecord
  belongs_to :user

  enum status:{
    has_empty: 0, #空きあり
    will_empty: 1, #空き予定
    no_empty: 9 #空き無し
  }
end
