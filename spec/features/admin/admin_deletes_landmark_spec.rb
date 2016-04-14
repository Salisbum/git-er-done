require 'rails_helper'
feature "Admin deletes a landmark" do
  let!(:user1) { FactoryGirl.create(:user) }

  scenario 'Admin sucessfully deletes a landmark & associated reviews' do
    pyramid = FactoryGirl.create(:landmark, user: user1)
    FactoryGirl.create(:review, landmark: pyramid, user: user1)

    admin_login

    visit landmarks_path

    expect(page).to have_content pyramid.name

    click_button "Delete"

    expect(page).to have_content "Landmark Deleted Successfully"
    expect(page).to_not have_content pyramid.name
  end
end
