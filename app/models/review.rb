class Review < ApplicationRecord

  belongs_to :user
  belongs_to :item

  validates :comment, presence: true
  validates :all_rating, presence: true
  validates :rating1, presence: true
  validates :rating2, presence: true
  validates :rating3, presence: true
  validates :rating4, presence: true

end