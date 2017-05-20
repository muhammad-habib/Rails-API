# spec/factories/user.rb
FactoryGirl.define do
  factory :user do
    name { Faker::Lorem.word }
    fbid { Faker::Number.number(10) }
  end
end