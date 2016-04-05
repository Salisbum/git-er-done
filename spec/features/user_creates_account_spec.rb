require 'rails_helper'

feature "User creates account" do
  scenario 'user navigates to sign up page' do
    visit '/users/sign_up'
    expect(page).to have_content('Please sign up!')
  end

  scenario 'user creates account' do
    visit '/users/sign_up'

    fill_in "Email", with: "derpherp@email.com"
    fill_in "Password", with: "derpherp"
    fill_in "Password confirmation", with: "derpherp"

    click_on "Sign Up"

    current_path.should == new_user_registration_path
  end
end
