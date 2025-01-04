class Post < ApplicationRecord
  belongs_to :blogger

  validates :text, presence: true
  validates :text, length: { maximum: 140 }
end
