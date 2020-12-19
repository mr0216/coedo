class Post < ApplicationRecord
  validates :title, presence: true
  validates :text, presence: true
  validates :category_id, numericality: { other_than: 1, message: 'Select.' }

  belongs_to :user
  has_one_attached :image
end
