require 'rails_helper'

RSpec.describe Review do
  let(:user) do
    User.new(
    email: "derpson@email.com",
    password: "12345678"
    )
  end

  let(:landmark) do
    Landmark.new(
      name: "Statue of Liberty",
      location: "New York",
      image: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a1/Statue_of_Liberty_7.jpg/500px-Statue_of_Liberty_7.jpg",
      description: "A colossal neoclassical sculpture on Liberty Island",
      user: user
    )
  end

  let(:review) do
    Review.new(
      body: "This place is crusty and old, why anyone comes here is beyond me.",
      landmark: landmark,
      user: user
    )
  end

  describe ".new" do
    user = FactoryGirl.create(:user)
    landmark = FactoryGirl.create(:landmark, user: user)
    review1 = FactoryGirl.create(:review, landmark: landmark, user: user)

    it "should be an Review object" do
      expect(review1).to be_a(Review)
    end
  end

end
