require 'rails_helper'

RSpec.describe Landmark, type: :model do
  let(:landmark) do
    Landmark.new(
      name: "Statue of Liberty",
      location: "New York",
      image: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a1/Statue_of_Liberty_7.jpg/500px-Statue_of_Liberty_7.jpg",
      description: "A colossal neoclassical sculpture on Liberty Island"
    )
  end

  describe ".new" do
    it "should be an Landmark object" do
      expect(landmark).to be_a(Landmark)
    end
  end

end
