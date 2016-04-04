class Landmark < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true
  validates :location, presence: true
  validates :image, presence: true
  validates :description, presence: true, length: { minimum: 50 }  
end
