require 'rails_helper'

feature "user sees a list of landmarks" do
  let!(:user) { FactoryGirl.create(:user) }

  scenario "[success!] sees a list of landmarks in alphabetical order" do
    FactoryGirl.create(:landmark, user: user)
    FactoryGirl.create(:landmark, user: user)
    FactoryGirl.create(:landmark, user: user)
    FactoryGirl.create(:landmark, user: user)
    FactoryGirl.create(:landmark, user: user)
    landmark6 = FactoryGirl.create(:landmark, user: user)
    landmark7 = FactoryGirl.create(:landmark, user: user)

    visit landmarks_path

    expect(page).to have_content("Eiffel", count: 5)

    click_on "Next"

    expect(page).to have_content landmark6.name
    expect(landmark6.name).to appear_before(landmark7.name)
  end
end
