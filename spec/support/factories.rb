FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person#{n}@example.com" }
    password "12345678"
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
