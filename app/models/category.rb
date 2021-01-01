class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '観光地' },
    { id: 3, name: '川越土産' },
    { id: 4, name: 'レストラン・カフェ' },
    { id: 5, name: 'ファッション・雑貨' },
    { id: 6, name: '体験' },
    { id: 7, name: 'イベント' },
    { id: 8, name: 'サービス・その他' },
    { id: 9, name: '該当なし' }
  ]
  include ActiveHash::Associations
  has_many :users
  has_many :posts
end
