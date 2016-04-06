require 'rails_helper'

feature "User deletes account" do
  scenario 'user navigates to edit account page' do
    user_login
    click_on 'Edit registration'
    expect(page).to have_content('Cancel my account')
  end

  scenario 'user deletes account' do
    user_login
    click_on 'Edit registration'
    click_on 'Cancel my account'

    expect(page).to have_content('Sign Up')
  end

  scenario 'user attempts to log in with deleted account' do
    user_login
    click_on 'Edit registration'
    click_on 'Cancel my account'
    click_on 'Login'
    fill_in 'Email', with: 'herpderp@gmail.com'
    fill_in 'Password', with: '12345678'
    expect(page).to have_content('Log in')
  end
end
