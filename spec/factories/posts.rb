FactoryBot.define do
  factory :post do
    title       { Faker::Lorem.sentence }
    category_id { 2 }
    text        { Faker::Lorem.sentence }

    association :user
    after(:build) do |post|
      post.image.attach(io: File.open('public/noimage.png'), filename: 'noimage.png')
    end
  end
end
