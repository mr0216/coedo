class Post < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :text
    validates :image
  end
  validates :category_id, numericality: { other_than: 1, message: 'を選択してください' }

  belongs_to :user
  has_one_attached :image
end
