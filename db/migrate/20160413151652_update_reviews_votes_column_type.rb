class UpdateReviewsVotesColumnType < ActiveRecord::Migration
  def up
    remove_column :reviews, :votes
  end

  def down
    add_column :reviews, :votes, :string, default: "0", null: false
  end
end
