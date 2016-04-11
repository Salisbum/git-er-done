require 'rails_helper'

feature "User deletes their landmark" do
  scenario "user successfully deletes a landmark" do
    landmark = FactoryGirl.create(:landmark)

    visit landmarks_path

    expect(page).to have_content landmark.name

    click_button "Delete"

    expect(page).to have_content "Landmark Deleted Successfully"
    expect(page).to_not have_content landmark.name
  end
end
