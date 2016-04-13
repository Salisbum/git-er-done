require 'rails_helper'

RSpec.describe Review do
  describe ".new" do
    user = FactoryGirl.create(:user)
    landmark = FactoryGirl.create(:landmark, user: user)
    review1 = FactoryGirl.create(:review, landmark: landmark, user: user)

    it "should be an Review object" do
      expect(review1).to be_a(Review)
    end
  end

end
