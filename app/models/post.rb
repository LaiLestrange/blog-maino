class Post < ApplicationRecord
  belongs_to :blogger

  validates :text, presence: true
  validates :text, length: { maximum: 140 }

  enum :status, { posted: 0, edited: 5, deleted: 9 }, default: :posted

  after_update :post_updated

  private

  def post_updated
    return if edited? || deleted?

    edited!
  end
end
