class AddLandmarkRatingtoReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :landmark_review, :integer
  end
end
