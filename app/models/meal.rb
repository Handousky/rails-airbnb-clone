class Meal < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
end
