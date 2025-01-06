class Post < ApplicationRecord
  belongs_to :blogger
  acts_as_taggable_on :tags
  accepts_nested_attributes_for :tags

  validates :text, presence: true
  validates :text, length: { maximum: 140 }

  enum :status, { posted: 0, edited: 3, deleted: 5, recycled: 7 }, default: :posted

  after_update :post_updated

  private

  def post_updated
    return if edited? || deleted?

    edited!
  end
end
