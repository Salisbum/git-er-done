class AddAverageReviewtoLandmarks < ActiveRecord::Migration
  def change
    add_column :landmarks, :average_review, :integer
  end
end
