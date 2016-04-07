require 'rails_helper'

# [] Visiting the `/landmarks/1` path should show the landmark details for a landmark with the ID of 1.

feature "user edits their profile" do
  scenario "successfully edits profile" do
    user = FactoryGirl.create(:user)

    profile = Profile.create(
      username: "Xander321",
      location: "Boston",
      avatar_url: "https://s-media-cache-ak0.pinimg.com/236x/50/bb/11/50bb1149e480e46d721d8a813a8ef3d4.jpg",
      pun: "Isn't this punny?",
      user: user
    )

    visit root_path
    click_on 'Login'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'

    visit profile_path(profile)

    click_link "Edit Profile"

    expect(page).to have_content "Edit Profile"

    fill_in "Username", with: "BillyBob"
    fill_in "Location", with: "France"
    fill_in "Pun", with: "Know thy pun?"

    click_button "Update Profile"

    expect(page).to have_content "BillyBob"
    expect(page).to have_content "France"
    expect(page).to have_content "Know thy pun?"
    expect(page).to have_content "Successfully edited your Profile!"
  end

  scenario "successfully edits profile" do
    user = FactoryGirl.create(:user)
    user2 = User.create(
      email: "bananas@gmail.com",
      password: "11111111"
    )

    profile = Profile.create(
      username: "Xander321",
      location: "Boston",
      avatar_url: "https://s-media-cache-ak0.pinimg.com/236x/50/bb/11/50bb1149e480e46d721d8a813a8ef3d4.jpg",
      pun: "Isn't this punny?",
      user: user
    )

    Profile.create(
      username: "BillyBob",
      location: "Boston",
      avatar_url: "https://s-media-cache-ak0.pinimg.com/236x/50/bb/11/50bb1149e480e46d721d8a813a8ef3d4.jpg",
      pun: "Isn't this punny?",
      user: user2
    )

    visit root_path
    click_on 'Login'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'

    visit profile_path(profile)

    click_link "Edit Profile"

    expect(page).to have_content "Edit Profile"

    fill_in "Username", with: "BillyBob"

    click_button "Update Profile"

    expect(page).to have_content "Did not manage to update profile. Username has already been taken."
  end
end
