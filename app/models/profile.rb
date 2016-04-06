class Profile < ActiveRecord::Base
  belongs_to :user
  
  validates :username, presence: true, uniqueness: true
  validates :user, presence: true
end
