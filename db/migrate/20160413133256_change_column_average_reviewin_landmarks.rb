class ChangeColumnAverageReviewinLandmarks < ActiveRecord::Migration
  def change
    change_column :landmarks, :average_review, :string, default: "0"
  end
end
