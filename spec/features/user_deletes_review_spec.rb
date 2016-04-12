require 'rails_helper'

# [] Visiting the `/landmarks/1` path should show the landmark details for a landmark with the ID of 1.

feature "user deletes a review" do
  scenario "user views landmark and deletes review" do
    user2 = FactoryGirl.create(:user)
    user3 = FactoryGirl.create(:user)
    user4 = FactoryGirl.create(:user)

    statue_of_liberty = Landmark.create(
      name: "Statue of Liberty",
      location: "New York",
      image: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a1/Statue_of_Liberty_7.jpg/500px-Statue_of_Liberty_7.jpg",
      description: "A colossal neoclassical sculpture on Liberty Island",
      user: user2
    )

    Review.create(
      body: "SO FRESH AND SO GREEN GUYS",
      landmark: statue_of_liberty,
      user: user2,
      votes: "3"
    )

    Review.create(
      body: "I don't even think the statue can read.",
      landmark: statue_of_liberty,
      user: user3,
      votes: "56"
    )

    Review.create(
      body: "I got tired walking up the stairs.",
      landmark: statue_of_liberty,
      user: user4,
      votes: "-3"
    )

    user_login

    visit landmarks_path
    click_link "Statue of Liberty"

    expect(page).to have_content statue_of_liberty.name
    page.all('.button_to')[1].click_button "Delete Review"
    expect(page).to have_content("Review Deleted Successfully")
  end
end
