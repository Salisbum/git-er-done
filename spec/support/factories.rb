FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "#{n}herpderp@gmail.com" }
    password "herpderp"
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
    sequence(:votes) { |n| "#{n}" }
  end

end
