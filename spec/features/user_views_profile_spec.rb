require 'rails_helper'

# [] Visiting the `/landmarks/1` path should show the landmark details for a landmark with the ID of 1.

feature "new user views to their profile page" do
  scenario "new user sees personal information" do
    user = FactoryGirl.create(:user)

    profile = Profile.create(
      username: "Xander321",
      location: "Boston",
      avatar_url: "https://s-media-cache-ak0.pinimg.com/236x/50/bb/11/50bb1149e480e46d721d8a813a8ef3d4.jpg",
      pun: "Isn't this punny?",
      user: user
    )

    visit profile_path(profile)

    expect(page).to have_content user.email
    expect(page).to have_content profile.username
    expect(page).to have_content profile.pun
    expect(page).to have_content profile.location
    page.should have_selector ("img[src$='#{profile.avatar_url}']")
  end
end
