require 'rails_helper'

# [] Visiting the `/landmarks/1` path should show the landmark details for a landmark with the ID of 1.

feature "user sees landmark show page" do
  scenario "clicks link and is taken to show page for given landmark" do
    statue_of_liberty = Landmark.create(
      name: "Statue of Liberty",
      location: "New York",
      image: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a1/Statue_of_Liberty_7.jpg/500px-Statue_of_Liberty_7.jpg",
      description: "A colossal neoclassical sculpture on Liberty Island"
    )

    visit landmarks_path

    click_link "Statue of Liberty"

    expect(page).to have_content statue_of_liberty.name
    expect(page).to have_content statue_of_liberty.location
    page.should have_selector ("img[scr$='#{statue_of_liberty.image}']")
    expect(page).to have_content statue_of_liberty.description
  end
end
