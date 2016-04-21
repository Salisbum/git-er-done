require 'rails_helper'
feature "User deletes account" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:profile) { FactoryGirl.create(:profile, user: user) }

  scenario 'user navigates to edit account page' do
    user_login

    click_link "Profile"

    click_on 'Edit registration'

    expect(page).to have_content('Cancel my account')
  end

  scenario 'user deletes their own account, expects all reviews to be deleted' do
    pyramid = FactoryGirl.create(:landmark, user: user)
    review = FactoryGirl.create(:review, landmark: pyramid, user: user)

    login(user)

    visit landmark_path(pyramid)
    expect(page).to have_content review.body

    click_link "Profile"

    click_on 'Edit registration'
    click_on 'Cancel my account'

    expect(page).to have_content('Bye! Your account has been successfully cancelled. We hope to see you again soon')

    admin_login

    visit landmark_path(pyramid)

    expect(page).to have_content("No reviews! Want to leave one?")
    expect(page).to_not have_content review.body
  end

  scenario 'user attempts to log in with deleted account' do
    user_login

    click_link "Profile"

    click_on 'Edit registration'

    click_on 'Cancel my account'

    click_on 'Login'

    fill_in 'Email', with: 'herpderp@gmail.com'
    fill_in 'Password', with: '12345678'
    click_on 'Log in'

    expect(page).to have_content('Log in')
  end
end
