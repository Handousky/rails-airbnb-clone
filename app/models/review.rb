class Review < ApplicationRecord
  belongs_to :meal

  validates :comment, presence: true
  validates :rating, presence: true
end
