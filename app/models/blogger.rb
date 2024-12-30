class Blogger < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :fullname, presence: true
  validates :username, presence: true,
                       format: { with: /\A[a-zA-Z0-9]+\z/, message: I18n.t('errors.messages.not_alphanumeric') }
  validates :username, uniqueness: true
  validates :email, :password, presence: true, on: :create
  validates :username, length: { in: 4..15 }
  validates :fullname, length: { in: 4..50 }
end
