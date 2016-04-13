require 'rails_helper'

# [] Visiting the `/landmarks/1` path should show the landmark details for a landmark with the ID of 1.

feature "user edits a review" do
  scenario "user views landmark's reviews and successfully edits one" do
    user2 = FactoryGirl.create(:user)
    user3 = FactoryGirl.create(:user)
    user4 = FactoryGirl.create(:user)

    user = FactoryGirl.create(:user)
    landmark = FactoryGirl.create(:landmark, user: user)

    review1 = FactoryGirl.create(:review, landmark: landmark, user: user2)
    FactoryGirl.create(:review, landmark: landmark, user: user4)
    FactoryGirl.create(:review, landmark: landmark, user: user3)

    login(user2)

    visit landmarks_path

    click_link landmark.name

    expect(page).to have_content landmark.name
    expect(page).to have_content review1.body
    first('.review > a').click

    fill_in "Review", with: "SO FRESH AND SO GREEN GUYS. SERIOUSLY. Who knew copper turned green!? themoreyouknow.gif"

    click_on "Submit"

    expect(page).to have_content("SO FRESH AND SO GREEN GUYS. SERIOUSLY. Who knew copper turned green!? themoreyouknow.gif")
  end

  scenario "user views landmark's reviews and unsuccessfully edits one" do
    user2 = FactoryGirl.create(:user)
    user3 = FactoryGirl.create(:user)
    user4 = FactoryGirl.create(:user)

    user = FactoryGirl.create(:user)
    landmark = FactoryGirl.create(:landmark, user: user)

    review1 = FactoryGirl.create(:review, landmark: landmark, user: user2)
    FactoryGirl.create(:review, landmark: landmark, user: user4)
    FactoryGirl.create(:review, landmark: landmark, user: user3)

    login(user2)

    visit landmarks_path

    click_link landmark.name

    expect(page).to have_content landmark.name
    expect(page).to have_content review1.body

    first('.review > a').click

    fill_in "Review", with: ""

    click_on "Submit"

    expect(page).to have_content("Body can't be blank")
  end
end
