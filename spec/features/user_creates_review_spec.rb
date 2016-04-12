require 'rails_helper'

# [] Visiting the `/landmarks/1` path should show the landmark details for a landmark with the ID of 1.

feature "user creates a new review" do
  scenario "user views landmark and adds review" do
    user = FactoryGirl.create(:user)
    landmark = FactoryGirl.create(:landmark, user: user)

    user_login

    visit landmarks_path

    click_link landmark.name

    expect(page).to have_content landmark.name

    fill_in "Review", with: "It's SO GREEN, GUYS."
    click_on "Submit"

    expect(page).to have_content("It's SO GREEN, GUYS.")
  end
  scenario "user attempts to create Review with no body" do
    user = FactoryGirl.create(:user)
    landmark = FactoryGirl.create(:landmark, user: user)

    user_login

    visit landmarks_path

    click_link landmark.name

    expect(page).to have_content landmark.name

    click_on "Submit"

    expect(page).to have_content("Review was not saved!")
  end
  scenario "user attempts to create Review exceeding character limit" do
    user = FactoryGirl.create(:user)
    landmark = FactoryGirl.create(:landmark, user: user)

    wall_of_text = Faker::Lorem.characters(1020)

    user_login

    visit landmarks_path

    click_link landmark.name

    expect(page).to have_content landmark.name

    fill_in "Review", with: wall_of_text
    click_on "Submit"
    expect(page).to have_content("Review was not saved!")
  end
end
