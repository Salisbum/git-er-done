require 'rails_helper'

feature "User visits users index" do
  let!(:user1) { FactoryGirl.create(:user) }

  scenario "Admin deletes user sucessfully" do
    Profile.create(
      username: "Xander321",
      location: "Boston",
      avatar_url: "https://s-media-cache-ak0.pinimg.com/236x/50/bb/11/50bb1149e480e46d721d8a813a8ef3d4.jpg",
      pun: "Isn't this punny?",
      user: user1
    )

    admin_login
    visit profiles_path

    expect(page).to have_content user1.email

    click_on "Delete"

    expect(page).to_not have_content user1.email
    expect(page).to have_content "Account Deleted Successfully!"
  end

  scenario "User attempts to view profiles path" do
    Profile.create(
      username: "Xander321",
      location: "Boston",
      avatar_url: "https://s-media-cache-ak0.pinimg.com/236x/50/bb/11/50bb1149e480e46d721d8a813a8ef3d4.jpg",
      pun: "Isn't this punny?",
      user: user1
    )

    user_login

    expect(page).to_not have_content user1.email
    expect(page.current_path).to eq root_path
  end
end
