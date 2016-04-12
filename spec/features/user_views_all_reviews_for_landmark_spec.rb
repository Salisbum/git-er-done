require 'rails_helper'

# [] Visiting the `/landmarks/1` path should show the landmark details for a landmark with the ID of 1.

feature "user views all reviews on a landmark" do
  let!(:user) { FactoryGirl.create(:user) }

  scenario "user views landmark with reviews" do
    user2 = FactoryGirl.create(:user)
    user3 = FactoryGirl.create(:user)
    user4 = FactoryGirl.create(:user)

    landmark = FactoryGirl.create(:landmark, user: user)

    review1 = FactoryGirl.create(:review, landmark: landmark, user: user2)
    review2 = FactoryGirl.create(:review, landmark: landmark, user: user4)
    review3 = FactoryGirl.create(:review, landmark: landmark, user: user3)

    user_login

    visit landmarks_path

    click_link landmark.name

    expect(page).to have_content landmark.name
    expect(page).to have_content review1.body
    expect(page).to have_content review2.user.email
    expect(page).to have_content review3.votes
  end
  scenario "user views landmark with no reviews" do
    landmark = FactoryGirl.create(:landmark, user: user)

    user_login

    visit landmarks_path

    click_link landmark.name

    expect(page).to have_content landmark.name
    expect(page).to have_content("No reviews! Want to leave one?")
  end
end
