require 'rails_helper'

feature "User deletes their landmark" do
  scenario "user successfully deletes a landmark" do
    grand_canyon = Landmark.create(
      name: "Grand Canyon",
      location: "Arizona",
      image: "https://lh6.googleusercontent.com/-0IU2MaN1t0c/AAAAAAAAAAI/AAAAAAAAABs/ROeqMxHHRfY/s0-c-k-no-ns/photo.jpg",
      description: "A colossal neoclassical sculpture on Liberty Island"
    )

    visit landmarks_path

    expect(page).to have_content grand_canyon.name

    click_button "Delete"

    expect(page).to have_content "Landmark Deleted Successfully"
    expect(page).to_not have_content grand_canyon.name
  end
end
