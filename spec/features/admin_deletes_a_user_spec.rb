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

    pyramid = Landmark.create(
      name: "Pyramids of Giza",
      location: "Egypt",
      image: "https://upload.wikimedia.org/wikipedia/commons/e/e3/Kheops-Pyramid.jpg",
      description: "hot, but awesome.",
      user: user1
    )

    Review.create(
      body: "This place was so dope",
      landmark: pyramid,
      user: user1,
      votes: "4"
    )

    admin_login
    visit landmark_path(pyramid)
    expect(page).to have_content "This place was so dope"

    visit profiles_path

    expect(page).to have_content user1.email

    click_on "Delete"

    expect(page).to_not have_content user1.email
    expect(page).to have_content "Account Deleted Successfully!"

    visit landmark_path(pyramid)
    expect(page).to_not have_content "This place was so dope"
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
