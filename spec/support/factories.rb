require_relative 'helpers'

FactoryGirl.define do

  factory :user do
    sequence(:email) { |n| "person#{n}@example.com" }
    password "12345678"
  end

  factory :landmark do
    sequence(:name) { |n| "#{n}Eiffel Tower" }
    location "Paris, FR"
    image "http://cdn.history.com/sites/2/2015/04/hith-eiffel-tower-iStock_000016468972Large.jpg"
    description "Very tall, lots of metal."
    user
  end

  factory :review do
    body "This place was so dope"
    landmark
    user
  end

  factory :profile do
    sequence(:username) { |n| "Xander321#{n}" }
    location "Boston"
    avatar_url "https://s-media-cache-ak0.pinimg.com/236x/50/bb/11/50bb1149e480e46d721d8a813a8ef3d4.jpg"
    pun "Isn't this punny?!"
    user
  end
end
