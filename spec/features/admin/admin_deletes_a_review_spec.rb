require 'rails_helper'

feature "Admin deletes a review" do
  let!(:user1) { FactoryGirl.create(:user) }

  scenario "Admin deletes a review sucessfully" do
    FactoryGirl.create(:profile, user: user1)
    pyramid = FactoryGirl.create(:landmark, user: user1)
    FactoryGirl.create(:review, landmark: pyramid, user: user1)

    admin_login

    visit landmark_path(pyramid)

    expect(page).to have_content "This place was so dope"

    click_on "Delete"

    expect(page).to_not have_content "This place was so dope"
  end
end
