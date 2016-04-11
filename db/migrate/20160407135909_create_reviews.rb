class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :body, null: false
      t.belongs_to :landmark, null: false
      t.string :votes, null: false, default: "0"
      t.belongs_to :user, null: false
    end
  end
end
