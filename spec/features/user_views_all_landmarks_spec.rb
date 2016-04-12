require 'rails_helper'

feature "user sees a list of landmarks" do
  let(:user) { FactoryGirl.create(:user) }
  let!(:landmarks) { FactoryGirl.create_list(:landmark, 7, user: user) }

  scenario "[success!] sees a list of landmarks in alphabetical order" do
    visit landmarks_path

    expect(page).to have_content("Eiffel", count: 5)

    click_on "Next"

    expect(page).to have_content landmarks[-2].name
    expect(landmarks[-2].name).to appear_before(landmarks.last.name)
  end
end
