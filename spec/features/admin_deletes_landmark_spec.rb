require 'rails_helper'
feature "Admin deletes a landmark" do
  let!(:user1) { FactoryGirl.create(:user) }

  scenario 'Admin sucessfully deletes a landmark & associated reviews' do
    pyramid = Landmark.create(
      name: "Pyramids of Giza",
      location: "Egypt",
      image: "https://upload.wikimedia.org/wikipedia/commons/e/e3/Kheops-Pyramid.jpg",
      description: "hot, but awesome.",
      user: user1
    )

    Review.create(
      body: "This place was so dope",
      landmark: pyramid,
      user: user1,
      votes: "4"
    )

    admin_login

    visit landmarks_path

    expect(page).to have_content "Pyramids of Giza"

    click_button "Delete"

    expect(page).to have_content "Landmark Deleted Successfully"
    expect(page).to_not have_content "Pyramids of Giza"
  end
end
