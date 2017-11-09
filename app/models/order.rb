class Order < ApplicationRecord
  belongs_to :user
  belongs_to :meal

  validates :user, presence: true
  validates :meal, presence: true
end
