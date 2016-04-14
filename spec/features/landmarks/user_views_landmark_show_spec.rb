require 'rails_helper'

# [] Visiting the `/landmarks/1` path should show the landmark details for a landmark with the ID of 1.

feature "user sees landmark show page" do
  let!(:user) { FactoryGirl.create(:user) }

  scenario "clicks link and is taken to show page for given landmark" do
    landmark = FactoryGirl.create(:landmark, user: user)
    user_login
    visit landmarks_path

    click_link landmark.name

    expect(page).to have_content landmark.name
    expect(page).to have_content landmark.location
    expect(page).to have_content ("Average Rating: 0")
    page.should have_selector ("img[src$='#{landmark.image}']")
    expect(page).to have_content landmark.description
  end
end
