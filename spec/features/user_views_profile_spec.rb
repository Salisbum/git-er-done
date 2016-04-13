require 'rails_helper'

# [] Visiting the `/landmarks/1` path should show the landmark details for a landmark with the ID of 1.

feature "new user views to their profile page" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:profile) { FactoryGirl.create(:profile, user: user) }

  scenario "new user sees personal information" do
    visit root_path
    click_link "Login"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    visit profile_path(profile)
    
    expect(page).to have_content user.email
    expect(page).to have_content profile.username
    expect(page).to have_content profile.pun
    expect(page).to have_content profile.location
    page.should have_selector ("img[src$='#{profile.avatar_url}']")
  end
end
