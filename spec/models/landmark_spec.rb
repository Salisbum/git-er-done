require 'rails_helper'

RSpec.describe Landmark do
  describe ".new" do
    user = FactoryGirl.create(:user)
    landmark = FactoryGirl.create(:landmark, user: user)

    it "should be an Landmark object" do
      expect(landmark).to be_a(Landmark)
    end
  end

end
