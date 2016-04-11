require 'rails_helper'

# [] Visiting the `/landmarks/1` path should show the landmark details for a landmark with the ID of 1.

feature "user creates a new review" do
  scenario "user views landmark and adds review" do
    user2 = FactoryGirl.create(:user)
    user3 = FactoryGirl.create(:user)
    user4 = FactoryGirl.create(:user)

    statue_of_liberty = Landmark.create(
      name: "Statue of Liberty",
      location: "New York",
      image: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a1/Statue_of_Liberty_7.jpg/500px-Statue_of_Liberty_7.jpg",
      description: "A colossal neoclassical sculpture on Liberty Island"
    )

    review1 = Review.create(
      body: "SO FRESH AND SO GREEN GUYS",
      landmark: statue_of_liberty,
      user: user2,
      votes: "3"
    )

    review2 = Review.create(
      body: "I don't even think the statue can read.",
      landmark: statue_of_liberty,
      user: user3,
      votes: "56"
    )

    review3 = Review.create(
      body: "I got tired walking up the stairs.",
      landmark: statue_of_liberty,
      user: user4,
      votes: "-3"
    )

    user_login

    visit landmarks_path

    click_link "Statue of Liberty"

    expect(page).to have_content statue_of_liberty.name
    expect(page).to have_content review1.body
    expect(page).to have_content review2.user.email
    expect(page).to have_content review3.votes
  end
  scenario "user views landmark with no reviews" do
    statue_of_liberty = Landmark.create(
      name: "Statue of Liberty",
      location: "New York",
      image: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a1/Statue_of_Liberty_7.jpg/500px-Statue_of_Liberty_7.jpg",
      description: "A colossal neoclassical sculpture on Liberty Island"
    )

    user_login

    visit landmarks_path

    click_link "Statue of Liberty"

    expect(page).to have_content statue_of_liberty.name
    expect(page).to have_content("No reviews! Want to leave one?")
  end
end
