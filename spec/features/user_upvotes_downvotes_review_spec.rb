require "rails_helper"

feature "User upvotes and downvotes a review" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:landmark) { FactoryGirl.create(:landmark, user: user) }
  let!(:review) { FactoryGirl.create(:review, landmark: landmark, user: user) }

  scenario "user views upvote and downvote options" do
    user_login

    visit landmark_path(landmark)
    expect(page).to have_content("+1")
    expect(page).to have_content("-1")
  end
end
