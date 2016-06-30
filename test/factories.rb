require 'faker'

FactoryGirl.define do

  factory :user do
    email Faker::Internet.email
    password Faker::Internet.password
  end

  factory :poll do
    user
    text Faker::Lorem.sentence
  end

  factory :choice do
    text Faker::Lorem.sentence
  end

end
