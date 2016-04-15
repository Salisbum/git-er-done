require 'rails_helper'

feature "User visits users index" do
  let!(:user1) { FactoryGirl.create(:user) }

  scenario "Admin deletes user sucessfully" do
    FactoryGirl.create(:profile, user: user1)
    pyramid = FactoryGirl.create(:landmark, user: user1)
    FactoryGirl.create(:review, landmark: pyramid, user: user1)

    admin_login

    visit landmark_path(pyramid)

    expect(page).to have_content "This place was so dope"

    visit profiles_path

    expect(page).to have_content user1.email

    page.all('.button_to')[0].click_button "Delete"

    expect(page).to_not have_content user1.email
    expect(page).to have_content "Account Deleted Successfully!"

    visit landmark_path(pyramid)

    expect(page).to_not have_content "This place was so dope"
  end

  scenario "User attempts to view profiles path" do
    FactoryGirl.create(:profile, user: user1)

    user_login

    expect(page).to_not have_content user1.email
    expect(page.current_path).to eq root_path
  end
end
