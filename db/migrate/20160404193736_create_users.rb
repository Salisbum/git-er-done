class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :username, null: false
      t.string :avatar_url, null: false
      t.timestamps null: false
      t.string :password_digest, null: false
    end
  end
end
