require 'rails_helper'

feature "unauthenticated user attempts to view a specific landmark page" do
  scenario "unauthenticated user attempts to view a specific landmark page" do
    user = FactoryGirl.create(:user)
    landmark = FactoryGirl.create(:landmark, user: user)

    visit landmark_path(landmark)

    expect(page).to have_content ("You need to sign in or sign up before continuing.")
  end
end
