class Blogger < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy

  validates :fullname, presence: true
  validates :username, presence: true,
                       format: { with: /\A[a-zA-Z0-9]+\z/, message: I18n.t('errors.messages.not_alphanumeric') }
  validates :username, uniqueness: true
  validates :username, length: { in: 4..15 }
  validates :fullname, length: { in: 4..50 }
end
