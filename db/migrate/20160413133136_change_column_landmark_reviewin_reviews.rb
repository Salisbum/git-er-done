class ChangeColumnLandmarkReviewinReviews < ActiveRecord::Migration
  def change
    change_column :reviews, :landmark_review, :string
  end
end
