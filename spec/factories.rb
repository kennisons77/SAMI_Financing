require 'faker'

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
  
  factory :borrower do
    title { Faker::Company.name }
  end
  
end