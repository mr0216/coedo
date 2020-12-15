class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :category
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :postal_code
    validates :city
    validates :street
    validates :phone_number
  end

  validates :password, presence: true,
                       format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i,
                                 message: 'Include both letters and numbers' }

  with_options numericality: { other_than: 1, message: 'Select.' } do
    validates :prefecture_id
    validates :category_id
  end

  has_many :posts
end
