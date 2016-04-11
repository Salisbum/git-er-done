class CreateLandmarks < ActiveRecord::Migration
  def change
    create_table :landmarks do |t|
      t.string :name, null: false
      t.string :location, null: false
      t.string :image, null: false
      t.text :description, null: false
      t.timestamps null: false
    end
  end
end
