FactoryGirl.define do
  factory :user do
    sequence(:email)  { |e| "herpderp#{e}@gmail.com" }
    password "herpderp"
  end
end
