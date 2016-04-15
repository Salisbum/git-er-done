require 'rails_helper'

feature "user edits their profile" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:profile) { FactoryGirl.create(:profile, user: user) }

  scenario "successfully edits profile" do

    visit root_path
    click_on 'Login'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'

    visit profile_path(profile)

    click_link "Edit Profile"

    expect(page).to have_content("Edit Profile")

    fill_in "Username", with: "BillyBob"
    fill_in "Location", with: "France"
    fill_in "Pun", with: "Know thy pun?"
    attach_file "Avatar url", "#{Rails.root}/spec/support/images/photo.jpg"

    click_button "Update Profile"

    expect(page).to have_content "BillyBob"
    expect(page).to have_content "France"
    expect(page).to have_content "Know thy pun?"
    expect(page).to have_css("img[src*='photo.jpg']")
    expect(page).to have_content "Successfully edited your Profile!"
  end

  scenario "unsuccessfully edits profile because file size too big" do

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
    attach_file "Avatar url", "#{Rails.root}/spec/support/images/person.jpg"

    click_button "Update Profile"

    expect(page).to have_content "should be less than 500KB"
  end

  scenario "successfully edits profile" do
    Profile.create(
      username: "BillyBob",
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

    click_button "Update Profile"

    expect(page).to have_content "Did not manage to update profile. Username has already been taken."
  end
end
