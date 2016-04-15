require 'rails_helper'
feature "User edits account" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:profile) { FactoryGirl.create(:profile, user: user) }

  scenario 'user navigates to edit account page' do
    login(user)
    visit profile_path(profile)
    click_on 'Edit registration'
    expect(page).to have_content('Edit User')
  end
  scenario 'user edits account with correct data' do
    login(user)
    visit profile_path(profile)
    click_on 'Edit registration'
    fill_in 'Password', with: '11111111'
    fill_in 'Password confirmation', with: '11111111'
    fill_in 'Current password', with: '12345678'
    click_on 'Update'

    expect(page).to have_content('Logout')
  end
  scenario 'user edits account with bad data' do
    login(user)
    visit profile_path(profile)
    click_on 'Edit registration'
    fill_in 'Password', with: '11111111'
    fill_in 'Password confirmation', with: '11'
    fill_in 'Current password', with: '12345678'
    click_on 'Update'

    expect(page).to have_content("Password confirmation doesn't match Password")
  end
end
