class User < ApplicationRecord


  before_validation :strip_whitespace
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }
  validates :password,
  presence: true,
  format: { with: /\A(?=.*[a-zA-Z])(?=.*[0-9]).{6,}\z/ }

end

private

def strip_whitespace
  self.email = email.strip unless email.nil?
end
