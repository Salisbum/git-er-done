require 'rails_helper'
feature "User searches for a landmark" do
  let!(:statue_of_liberty) { Landmark.create(
    name: "Statue of Liberty",
    location: "New York",
    image: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a1/Statue_of_Liberty_7.jpg/500px-Statue_of_Liberty_7.jpg",
    description: "A colossal neoclassical sculpture on Liberty Island"
    ) }

    let!(:grand_canyon) { Landmark.create(
      name: "Grand Canyon",
      location: "Arizona",
      image: "https://lh6.googleusercontent.com/-0IU2MaN1t0c/AAAAAAAAAAI/AAAAAAAAABs/ROeqMxHHRfY/s0-c-k-no-ns/photo.jpg",
      description: "A colossal neoclassical sculpture on Liberty Island"
      ) }

  scenario "User finds said landmark" do


    visit landmarks_path

    expect(page).to have_content "Search"
    expect(page).to have_content statue_of_liberty.name
    expect(page).to have_content grand_canyon.name

    fill_in 'Search', with: "Statue of Liberty"

    click_button "Search"

    expect(page).to have_content statue_of_liberty.name
    expect(page).to_not have_content grand_canyon.name
  end

  scenario "User does not find said landmark" do
    visit landmarks_path

    expect(page).to have_content "Search"
    expect(page).to have_content statue_of_liberty.name
    expect(page).to have_content grand_canyon.name

    fill_in 'Search', with: "Stuff"

    click_button "Search"

    expect(page).to have_content "Nothing matches that search"
    expect(page).to_not have_content statue_of_liberty.name
    expect(page).to_not have_content grand_canyon.name
  end

  scenario "User finds said landmark via partial search" do
    visit landmarks_path

    expect(page).to have_content "Search"
    expect(page).to have_content statue_of_liberty.name
    expect(page).to_not have_content grand_canyon.name

    fill_in 'Search', with: "Grand"

    click_button "Search"

    expect(page).to have_content grand_canyon.name
    expect(page).to_not have_content statue_of_liberty.name
  end
end
