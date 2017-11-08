class Meal < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_attachment :photo
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def avg_rating
    self.reviews.empty? ? 0 : (self.reviews.map{ |r| r.rating }.reduce(:+) / self.reviews.length)
  end
end
