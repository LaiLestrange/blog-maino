class Post < ApplicationRecord
  belongs_to :blogger

  validates :text, presence: true
  validates :text, length: { maximum: 140 }

  enum :status, { posted: 0, edited: 5, deleted: 9 }, default: :posted
end
