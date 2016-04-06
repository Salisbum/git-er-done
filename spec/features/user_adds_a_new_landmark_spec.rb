require 'rails_helper'

# # [] A landmark must have a name, location, image url, and description.
# # [] Visiting the `/landmarks/new` path should display a form for creating a new landmark.
# # [] When adding a new landmark, if I fill out the form correctly, I should see the page for the newly created landmark.
# # [] When adding a new landmark, if I fill out the form incorrectly and submit the form, I should see the form and be displayed the validation errors.

feature "User visits new landmark path" do
  scenario "user adds a new landmark successfully" do
    visit new_landmark_path

    expect(page).to have_content "New Landmark Form"

    fill_in 'Name', with: "Statue of Liberty"
    fill_in 'Location', with: "New York"
    fill_in 'Image', with: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a1/Statue_of_Liberty_7.jpg/500px-Statue_of_Liberty_7.jpg"
    fill_in 'Description', with: "A colossal neoclassical sculpture on Liberty Island"

    click_button "Add Landmark"

    expect(page).to have_content "Landmark added successfully!"
    expect(page).to have_content "Statue of Liberty"
    expect(page).to have_content "New York"
    page.should have_selector ("img[src$='https://upload.wikimedia.org/wikipedia/commons/thumb/a/a1/Statue_of_Liberty_7.jpg/500px-Statue_of_Liberty_7.jpg']")
    expect(page).to have_content "A colossal neoclassical sculpture on Liberty Island"
  end

  scenario "visitor does not provide proper information for a landmark" do
      visit new_landmark_path

      click_button "Add Landmark"
      expect(page).to have_content "Name can't be blank"
      expect(page).to have_content "Location can't be blank"
      expect(page).to have_content "Image can't be blank"
      expect(page).to have_content "Description can't be blank"
    end
end
