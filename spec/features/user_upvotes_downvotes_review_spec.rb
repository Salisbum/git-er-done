require "rails_helper"

feature "User upvotes and downvotes a review" do
  scenario "user views upvote and downvote options" do
    user = FactoryGirl.create(:user)
    landmark = FactoryGirl.create(:landmark)
    FactoryGirl.create(:review, landmark: landmark)

    visit new_user_session_path
    user_login

    visit landmark_path(landmark)
    expect(page).to have_content("+1")
    expect(page).to have_content("-1")
  end
end
