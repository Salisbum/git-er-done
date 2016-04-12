require 'rails_helper'

RSpec.describe Review do
  let(:landmark) do
    Landmark.new(
      name: "Statue of Liberty",
      location: "New York",
      image: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a1/Statue_of_Liberty_7.jpg/500px-Statue_of_Liberty_7.jpg",
      description: "A colossal neoclassical sculpture on Liberty Island"
    )
  end

  let(:user) do
    User.new(
      email: "derpson@email.com",
      password: "12345678"
    )
  end

  let(:review) do
    Review.new(
      body: "This place is crusty and old, why anyone comes here is beyond me.",
      landmark: landmark,
      votes: "2",
      user: user
    )
  end

  describe ".new" do
    it "should be an Review object" do
      expect(review).to be_a(Review)
    end
  end

end
