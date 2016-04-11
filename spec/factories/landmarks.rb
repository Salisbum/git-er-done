FactoryGirl.define do
  factory :landmark do
    name "Eiffel Tower"
    location "Paris, FR"
    image "http://cdn.history.com/sites/2/2015/04/hith-eiffel-tower-iStock_000016468972Large.jpg"
    description "Very tall, lots of metal."
    user FactoryGirl.create(:user)
  end
end
