# require 'rails_helper'
#
# # [] Visiting the `/landmarks/1` path should show the landmark details for a landmark with the ID of 1.
#
# feature "user votes on a review" do
#   scenario "user upvotes a review" do
#     statue_of_liberty = Landmark.create(
#       name: "Statue of Liberty",
#       location: "New York",
#       image: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a1/Statue_of_Liberty_7.jpg/500px-Statue_of_Liberty_7.jpg",
#       description: "A colossal neoclassical sculpture on Liberty Island"
#     )
#
#     review1 = Review.create(
#       body: "SO FRESH AND SO GREEN GUYS",
#       landmark: statue_of_liberty,
#       user: FactoryGirl.create(:user),
#       votes: "3"
#     )
#
#     review2 = Review.create(
#       body: "I don't even think the statue can read.",
#       landmark: statue_of_liberty,
#       user: FactoryGirl.create(:user),
#       votes: "56"
#     )
#
#     user_login
#
#     visit landmarks_path
#
#     click_link "Statue of Liberty"
#
#     expect(page).to have_content statue_of_liberty.name
#     click_on "upvote"
#     expect review1.votes.to eq("4")
#     expect review2.votes.to eq("56")
#   end
#   scenario "user downvotes a review" do
#     statue_of_liberty = Landmark.create(
#       name: "Statue of Liberty",
#       location: "New York",
#       image: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a1/Statue_of_Liberty_7.jpg/500px-Statue_of_Liberty_7.jpg",
#       description: "A colossal neoclassical sculpture on Liberty Island"
#     )
#
#     review1 = Review.create(
#       body: "SO FRESH AND SO GREEN GUYS",
#       landmark: statue_of_liberty,
#       user: FactoryGirl.create(:user),
#       votes: "3"
#     )
#
#     review2 = Review.create(
#       body: "I don't even think the statue can read.",
#       landmark: statue_of_liberty,
#       user: FactoryGirl.create(:user),
#       votes: "56"
#     )
#
#     user_login
#
#     visit landmarks_path
#
#     click_link "Statue of Liberty"
#
#     expect(page).to have_content statue_of_liberty.name
#     click_on "downvote"
#     expect review1.votes.to eq("2")
#     expect review2.votes.to eq("56")
#   end
# end
