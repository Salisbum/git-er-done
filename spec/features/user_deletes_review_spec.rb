require 'rails_helper'

# [] Visiting the `/landmarks/1` path should show the landmark details for a landmark with the ID of 1.

feature "user deletes a review" do
  scenario "user views landmark and deletes review" do
    user2 = FactoryGirl.create(:user)
    user3 = FactoryGirl.create(:user)
    user4 = FactoryGirl.create(:user)

    user = FactoryGirl.create(:user)
    landmark = FactoryGirl.create(:landmark, user: user)

    FactoryGirl.create(:review, landmark: landmark, user: user2)
    FactoryGirl.create(:review, landmark: landmark, user: user4)
    FactoryGirl.create(:review, landmark: landmark, user: user3)

    user_login

    visit landmarks_path
    click_link landmark.name

    expect(page).to have_content landmark.name
    page.all('.button_to')[1].click_button "Delete Review"
    expect(page).to have_content("Review Deleted Successfully")
  end
end
