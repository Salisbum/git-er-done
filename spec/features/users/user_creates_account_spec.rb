require 'rails_helper'
feature "User creates account" do
  scenario 'user navigates to sign up page' do
    visit '/users/sign_up'
    expect(page).to have_content('Please sign up!')
  end
  scenario 'user creates account' do
    visit '/'
    click_link 'Sign Up'

    fill_in "Email", with: "derpherp@email.com"
    fill_in "Password", with: "derpherp"
    fill_in "Password confirmation", with: "derpherp"
    click_on "Sign up"

    expect(page).to have_content("Logout")
  end
end
