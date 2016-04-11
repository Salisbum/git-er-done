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
    sequence(:votes) { |n| "#{n}" }
  end

end

FactoryGirl.define do
  factory :landmark do
    name "Grand Canyon"
    location "Arizona"
    iamge "https://lh6.googleusercontent.com/-0IU2MaN1t0c/AAAAAAAAAAI/AAAAAAAAABs/ROeqMxHHRfY/s0-c-k-no-ns/photo.jpg"
    description "A colossal neoclassical sculpture on Liberty Island"
  end
end
