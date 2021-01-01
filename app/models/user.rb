class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'が無効です' }
    validates :introduction
    validates :address
    validates :business_hour
    validates :image
  end

  validates :password, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: ' は半角英数字の両方を含めてください' }
  validates :category_id, numericality: { other_than: 1, message: ' を選択してください' }

  has_many :posts
  has_one_attached :image
end
