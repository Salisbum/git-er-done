require 'rails_helper'

feature "User edits an existing landmark" do

  scenario "User successfully edits a landmark" do
    user = FactoryGirl.create(:user)
    landmark = FactoryGirl.create(:landmark, user: user)
    login(user)
    
    visit landmarks_path

    click_button "Edit"

    expect(page).to have_content "Edit #{landmark.name}"

    fill_in 'Name', with: landmark.name
    fill_in 'Location', with: landmark.location
    fill_in 'Image', with: landmark.image
    fill_in 'Description', with: landmark.description

    click_button "Submit Landmark"

    expect(page).to have_content "Landmark updated successfully!"
    expect(page).to have_content landmark.name
    expect(page).to have_content landmark.location
    page.should have_selector ("img[src$='#{landmark.image}']")
    expect(page).to have_content landmark.description
  end

  scenario "User unsuccessfully edits a landmark" do
    user = FactoryGirl.create(:user)
    landmark = FactoryGirl.create(:landmark, user: user)
    login(user)

    visit landmarks_path

    click_button "Edit"

    fill_in 'Name', with: ""

    click_button "Submit Landmark"

    expect(page).to have_content "Update unsucessful. No changes were made."
    expect(page).to have_content "Edit #{landmark.name}"
  end
end
