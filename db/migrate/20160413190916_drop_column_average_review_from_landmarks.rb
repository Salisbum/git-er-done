class DropColumnAverageReviewFromLandmarks < ActiveRecord::Migration
  def change
    remove_column :landmarks, :average_review
  end
end
