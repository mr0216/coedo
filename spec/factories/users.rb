FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { 'bbb@bbb.com' }
    password              { 'a00000' }
    password_confirmation { password }
    category_id           { 2 }
    address               { "hoge"}
    phone_number          { '09012345678' }
    introduction          { Faker::Lorem.sentence} 
    url                   { 'http://localhost:3000/' }
    business_hour         { 'sample' }
    
    after(:build) do |user|
      user.image.attach(io: File.open('public/noimage.png'), filename: 'noimage.png')
    end
  end
end