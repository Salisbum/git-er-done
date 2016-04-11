FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "#{n}herpderp@gmail.com" }
    password "12345678"
  end
end
