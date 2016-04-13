require 'rails_helper'
feature "User deletes account" do
  let!(:user) { FactoryGirl.create(:user) }

  scenario 'user navigates to edit account page' do
    user_login
    click_on 'Edit registration'

    expect(page).to have_content('Cancel my account')
  end
  scenario 'user deletes account' do
    user1 = User.create(
      email: "tim@odsc.com",
      password: "11223344"
    )

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
      body: "This place was kinda dope",
      landmark: pyramid,
      user: user1,
      votes: "4"
    )

    visit root_path
    click_on 'Login'
    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password
    click_on 'Log in'
    visit landmark_path(pyramid)
    expect(page).to have_content "This place was kinda dope"

    click_on 'Edit registration'
    click_on 'Cancel my account'

    expect(page).to have_content('Sign Up')

    visit landmark_path(pyramid)
    expect(page).to_not have_content "This place was kinda dope"
  end
  scenario 'user attempts to log in with deleted account' do
    user_login
    click_on 'Edit registration'
    click_on 'Cancel my account'
    click_on 'Login'
    fill_in 'Email', with: 'herpderp@gmail.com'
    fill_in 'Password', with: '12345678'
    click_on 'Log in'

    expect(page).to have_content('Log in')
  end
end
