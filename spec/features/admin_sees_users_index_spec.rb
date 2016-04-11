require 'rails_helper'

feature "Admin visits users index" do
  # let!(:user1) { FactoryGirl.create(:user) }
  # let!(:user2) { FactoryGirl.create(:user) }

  scenario "Admin visits users index sucessfully" do
    user1 = User.create(
      email: "test1@gmail.com",
      password: "asdfasdf"
    )

    profile1 = Profile.create(
      username: "Xander321",
      location: "Boston",
      avatar_url: "https://s-media-cache-ak0.pinimg.com/236x/50/bb/11/50bb1149e480e46d721d8a813a8ef3d4.jpg",
      pun: "Isn't this punny?",
      user: user1
    )

    user2 = User.create(
      email: "test2@gmail.com",
      password: "asdfasdf"
    )

    profile1 = Profile.create(
    username: "Xander123",
    location: "Boston",
    avatar_url: "https://s-media-cache-ak0.pinimg.com/236x/50/bb/11/50bb1149e480e46d721d8a813a8ef3d4.jpg",
    pun: "Isn't this punny?",
    user: user2
    )

    user_login
    visit profiles_path

    expect(page).to have_content user1.email
    expect(page).to have_content user2.email
  end
end
