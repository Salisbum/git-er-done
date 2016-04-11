require 'rails_helper'

# [] Visiting the `/landmarks/1` path should show the landmark details for a landmark with the ID of 1.

feature "user edits a review" do
  scenario "user views landmark's reviews and successfully edits one" do
    statue_of_liberty = Landmark.create(
      name: "Statue of Liberty",
      location: "New York",
      image: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a1/Statue_of_Liberty_7.jpg/500px-Statue_of_Liberty_7.jpg",
      description: "A colossal neoclassical sculpture on Liberty Island"
    )

    user2 = FactoryGirl.create(:user)

    review1 = Review.create(
      body: "SO FRESH AND SO GREEN GUYS",
      landmark: statue_of_liberty,
      user: user2,
      votes: "3"
    )

    user_login

    visit landmarks_path

    click_link "Statue of Liberty"

    expect(page).to have_content statue_of_liberty.name
    expect(page).to have_content review1.body

    click_link "Edit Review"

    fill_in "Review", with: "SO FRESH AND SO GREEN GUYS. SERIOUSLY. Who knew copper turned green!? themoreyouknow.gif"

    click_on "Submit"

    expect(page).to have_content("SO FRESH AND SO GREEN GUYS. SERIOUSLY. Who knew copper turned green!? themoreyouknow.gif")
  end

  scenario "user views landmark's reviews and unsuccessfully edits one" do
    statue_of_liberty = Landmark.create(
      name: "Statue of Liberty",
      location: "New York",
      image: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a1/Statue_of_Liberty_7.jpg/500px-Statue_of_Liberty_7.jpg",
      description: "A colossal neoclassical sculpture on Liberty Island"
    )

    user = FactoryGirl.create(:user)

    review1 = Review.create(
      body: "SO FRESH AND SO GREEN GUYS",
      landmark: statue_of_liberty,
      user: user,
      votes: "3"
    )

    user_login

    visit landmarks_path

    click_link "Statue of Liberty"

    expect(page).to have_content statue_of_liberty.name
    expect(page).to have_content review1.body

    click_link "Edit Review"

    fill_in "Review", with: ""

    click_on "Submit"

    expect(page).to have_content("Body can't be blank")
  end
end
