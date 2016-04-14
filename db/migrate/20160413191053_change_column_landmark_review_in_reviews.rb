class ChangeColumnLandmarkReviewInReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :landmark_review

    add_column :reviews, :landmark_rating, :integer, default: 0
  end
end
