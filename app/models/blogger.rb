class Blogger < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, :fullname, presence: true
  validates :username, uniqueness: true
  validates :email, :password, presence: true, on: :create
  validates :username, length: { in: 4..15 }
  validates :fullname, length: { in: 4..50 }
end
