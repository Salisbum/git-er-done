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
    fill_in 'Image url', with: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a1/Statue_of_Liberty_7.jpg/500px-Statue_of_Liberty_7.jpg"
    fill_in 'Description', with: "A colossal neoclassical sculpture on Liberty Island"

    click_button "Edit Landmark"

    expect(page).to have_content statue_of_liberty.name
    expect(page).to have_content statue_of_liberty.location
    page.should have_selector ("img[scr$='#{statue_of_liberty.image}']")
    expect(page).to have_content statue_of_liberty.description
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

    click_button "Edit Landmark"

    expect(page).to have_content "No changes were made"
    expect(page).to have_content grand_canyon.name
    expect(page).to have_content grand_canyon.location
    page.should have_selector ("img[scr$='#{grand_canyon.image}']")
    expect(page).to have_content grand_canyon.description
  end
end
