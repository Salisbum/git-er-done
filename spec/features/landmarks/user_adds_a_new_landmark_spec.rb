require 'rails_helper'

# # [] A landmark must have a name, location, image url, and description.
# # [] Visiting the `/landmarks/new` path should display a form for creating a new landmark.
# # [] When adding a new landmark, if I fill out the form correctly, I should see the page for the newly created landmark.
# # [] When adding a new landmark, if I fill out the form incorrectly and submit the form, I should see the form and be displayed the validation errors.

feature "User visits new landmark path" do

  scenario "user adds a new landmark successfully" do
    user_login
    user = FactoryGirl.create(:user)
    landmark = FactoryGirl.create(:landmark, user: user)

    visit new_landmark_path

    expect(page).to have_content "New Landmark Form"

    fill_in 'Name', with: landmark.name
    fill_in 'Location', with: landmark.location
    fill_in 'Image', with: landmark.image
    fill_in 'Description', with: landmark.description

    click_button "Submit Landmark"
    expect(page).to have_content "Landmark added successfully!"
    expect(page).to have_content landmark.name
    expect(page).to have_content landmark.location
    expect(page).to have_content ("Average Rating: 0")
    expect(page).to have_selector ("img[src$='#{landmark.image}']")
    expect(page).to have_content landmark.description
  end

  scenario "visitor does not provide proper information for a landmark" do
    user_login
    visit new_landmark_path

    click_button "Submit Landmark"
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Location can't be blank"
    expect(page).to have_content "Image can't be blank"
    expect(page).to have_content "Description can't be blank"
  end
end
