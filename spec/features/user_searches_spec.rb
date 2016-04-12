require 'rails_helper'

feature "User searches for a landmark" do
  let!(:user) { FactoryGirl.create(:user) }

  before(:each) do
    @statue_of_liberty = FactoryGirl.create(:landmark, user: user)
    @grand_canyon = FactoryGirl.create(:landmark, user: user, name: "Grand Canyon")
  end

  scenario "User finds said landmark" do

    visit landmarks_path

    find_button "Search"
    expect(page).to have_content @statue_of_liberty.name
    expect(page).to have_content @grand_canyon.name

    fill_in 'search', with: @statue_of_liberty.name

    click_button "Search"

    expect(page).to have_content @statue_of_liberty.name
    expect(page).to_not have_content @grand_canyon.name
  end

  scenario "User does not find said landmark" do
    visit landmarks_path

    find_button "Search"
    expect(page).to have_content @statue_of_liberty.name
    expect(page).to have_content @grand_canyon.name

    fill_in 'search', with: "Stuff"

    click_button "Search"

    expect(page).to have_content "There are no landmarks containing the term(s) Stuff."
    expect(page).to_not have_content @statue_of_liberty.name
    expect(page).to_not have_content @grand_canyon.name
  end

  scenario "User finds said landmark via partial search" do
    visit landmarks_path

    find_button "Search"
    expect(page).to have_content @statue_of_liberty.name
    expect(page).to have_content @grand_canyon.name

    fill_in 'search', with: "Eiffel"

    click_button "Search"

    expect(page).to have_content @statue_of_liberty.name
    expect(page).to_not have_content @grand_canyon.name
  end
end
