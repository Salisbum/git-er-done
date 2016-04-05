require 'rails_helper'

feature "User creates account" do
  scenario 'user navigates to sign up page' do
    visit '/'
    click_on 'Sign Up'
    expect(page).to have_content('Please sign up!')
  end

  scenario 'user creates account' do
    visit '/'
    click_on 'Sign Up'

    user = FactoryGirl.create(:user)
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: user.password
    fill_in "Username", with: user.username
    click_on "Sign Up"

    expect(page).to have_content "Welcome! You have signed up successfully."
  end
end
