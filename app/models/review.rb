class Review < ApplicationRecord
  belongs_to :activity
  belongs_to :user
  RATING = [0, 1, 2, 3, 4, 5]
  validates :comment, presence: true
  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
