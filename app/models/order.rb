class Order < ApplicationRecord
  belongs_to :user
  belongs_to :meal

  validates :user, presence: true
  validates :meal, presence: true
  validates :time, presence: true
  validates :portions, presence: true
end
