require 'rails_helper'

# [] Visiting the `/landmarks/1` path should show the landmark details for a landmark with the ID of 1.

feature "user creates a new review" do
  scenario "user views landmark and adds review" do
    statue_of_liberty = Landmark.create(
      name: "Statue of Liberty",
      location: "New York",
      image: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a1/Statue_of_Liberty_7.jpg/500px-Statue_of_Liberty_7.jpg",
      description: "A colossal neoclassical sculpture on Liberty Island"
    )

    user_login

    visit landmarks_path

    click_link "Statue of Liberty"

    expect(page).to have_content statue_of_liberty.name

    fill_in "Review", with: "It's SO GREEN, GUYS."
    click_on "Submit"

    expect(page).to have_content("It's SO GREEN, GUYS.")
  end
  scenario "user attempts to create Review with no body" do
    statue_of_liberty = Landmark.create(
      name: "Statue of Liberty",
      location: "New York",
      image: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a1/Statue_of_Liberty_7.jpg/500px-Statue_of_Liberty_7.jpg",
      description: "A colossal neoclassical sculpture on Liberty Island"
    )

    user_login

    visit landmarks_path

    click_link "Statue of Liberty"

    expect(page).to have_content statue_of_liberty.name

    click_on "Submit"

    expect(page).to have_content("Review was not saved!")
  end
  scenario "user attempts to create Review exceeding character limit" do
    statue_of_liberty = Landmark.create(
      name: "Statue of Liberty",
      location: "New York",
      image: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a1/Statue_of_Liberty_7.jpg/500px-Statue_of_Liberty_7.jpg",
      description: "A colossal neoclassical sculpture on Liberty Island"
    )

    wall_of_text = "Private messaging is one of the main ways that people
    interact on Facebook. This type of direct messaging can be either an instant
    message (chat), or a regular email-type message. For both instant and
    regular messaging, there is a 20,000 character limit.

    A Facebook status may have character limits, but considering that it is at
    63,206 characters, unless you are writing War and Peace, you should be fine.
    Facebook has raised this number 12 times to accommodate user’s status and
    feedback.

    Facebook wall posts have a 5000 character limit, but truncation begins at
    477 characters. This enables someone to write a thoughtful response or
    create something similar to a blog.

    An area which is rarely used in Facebook is the Notes section. It is a
    writing area which many bloggers find useful. The reason is because Facebook
    Notes does not have a character limit, as of yet. Users are directed to this
    area if they have very long status or comment to make. This can be used to
    someone's advantage if they have a longer post to make and wish to share it
    with their friends through tagging."

    user_login

    visit landmarks_path

    click_link "Statue of Liberty"

    expect(page).to have_content statue_of_liberty.name

    fill_in "Review", with: wall_of_text
    click_on "Submit"
    expect(page).to have_content("Review was not saved!")
  end
end
