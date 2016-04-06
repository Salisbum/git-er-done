require 'rails_helper'

feature "User edits an existing landmark" do
  scenario "User successfully edits a landmark" do
    grand_canyon = Landmark.create(
      name: "Grand Canyon",
      location: "Arizona",
      image: "https://lh6.googleusercontent.com/-0IU2MaN1t0c/AAAAAAAAAAI/AAAAAAAAABs/ROeqMxHHRfY/s0-c-k-no-ns/photo.jpg",
      description: "A colossal neoclassical sculpture on Liberty Island"
    )

    visit landmarks_path

    click_button "Edit"

    expect(page).to have_content "Edit #{grand_canyon.name}"

    fill_in 'Name', with: "Statue of Liberty"
    fill_in 'Location', with: "New York"
    fill_in 'Image', with: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a1/Statue_of_Liberty_7.jpg/500px-Statue_of_Liberty_7.jpg"
    fill_in 'Description', with: "A colossal neoclassical sculpture on Liberty Island"

    click_button "Submit Landmark"

    expect(page).to have_content "Landmark updated successfully!"
    expect(page).to have_content "Statue of Liberty"
    expect(page).to have_content "New York"
    page.should have_selector ("img[src$='https://upload.wikimedia.org/wikipedia/commons/thumb/a/a1/Statue_of_Liberty_7.jpg/500px-Statue_of_Liberty_7.jpg']")
    expect(page).to have_content "A colossal neoclassical sculpture on Liberty Island"
  end

  scenario "User unsucessfully edits a landmark" do

    grand_canyon = Landmark.create(
      name: "Grand Canyon",
      location: "Arizona",
      image: "https://lh6.googleusercontent.com/-0IU2MaN1t0c/AAAAAAAAAAI/AAAAAAAAABs/ROeqMxHHRfY/s0-c-k-no-ns/photo.jpg",
      description: "A colossal neoclassical sculpture on Liberty Island"
    )

    visit landmarks_path

    click_button "Edit"

    fill_in 'Name', with: ""

    click_button "Submit Landmark"

    expect(page).to have_content "Update unsucessful. No changes were made."
    expect(page).to have_content "Edit #{grand_canyon.name}"
  end
end
