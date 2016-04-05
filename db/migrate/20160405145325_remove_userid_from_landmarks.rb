class RemoveUseridFromLandmarks < ActiveRecord::Migration
  def up
    remove_column :landmarks, :user_id
  end

  def down
    add_column :landmarks, :user_id, :integer, null: false
  end
end
