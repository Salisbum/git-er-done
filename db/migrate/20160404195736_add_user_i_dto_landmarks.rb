class AddUserIDtoLandmarks < ActiveRecord::Migration
  def change
    add_column :landmarks, :user_id, :integer, null: false
  end
end
