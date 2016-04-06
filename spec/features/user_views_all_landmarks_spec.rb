require 'rails_helper'
feature "user sees a list of landmarks" do
  scenario "[success!] sees a list of landmarks in alphabetical order" do
    statue_of_liberty = Landmark.create(
      name: "Statue of Liberty",
      location: "New York",
      image: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a1/Statue_of_Liberty_7.jpg/500px-Statue_of_Liberty_7.jpg",
      description: "A colossal neoclassical sculpture on Liberty Island"
    )

    grand_canyon = Landmark.create(
      name: "Grand Canyon",
      location: "Arizona",
      image: "https://lh6.googleusercontent.com/-0IU2MaN1t0c/AAAAAAAAAAI/AAAAAAAAABs/ROeqMxHHRfY/s0-c-k-no-ns/photo.jpg",
      description: "A colossal neoclassical sculpture on Liberty Island"
    )

    visit landmarks_path

    expect(page).to have_content statue_of_liberty.name
    expect(page).to have_content grand_canyon.name

    expect(grand_canyon.name).to appear_before(statue_of_liberty.name)
  end
end
