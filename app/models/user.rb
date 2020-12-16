class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :city
    validates :street
    validates :phone_number
    validates :introduction
    validates :business_hour
  end

  validates :password, presence: true,
                       format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i,
                                 message: 'Include both letters and numbers' }
  
  validates :category_id, numericality: { other_than: 1, message: 'Select.' }

  has_many :posts
  has_one_attached :image
end
