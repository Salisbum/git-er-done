require 'rails_helper'

feature "User logs out" do
  scenario 'user successfully logs out' do
    user = FactoryGirl.create(:user)
    visit '/'
    click_link 'Login'

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_on "Log in"

    expect(page).to have_content("Logout")
    expect(page).to_not have_content("Login")

    click_on "Logout"
    expect(page).to have_content("Login")
    expect(page).to_not have_content("Logout")
  end
end
