require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) do
    User.new(
      email: "derpson@email.com",
      password: "12345678"
    )
  end

  describe ".new" do
    it "should be an User object" do
      expect(user).to be_a(User)
    end
  end

  describe "#admin?" do
    it "is not an admin if the role is not admin" do
      user = FactoryGirl.create(:user, role: "member")
      expect(user.admin?).to eq(false)
    end

    it "is an admin if the role is admin" do
      user = FactoryGirl.create(:user, role: "admin")
      expect(user.admin?).to eq(true)
    end
  end
end
