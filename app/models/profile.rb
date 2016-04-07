class Profile < ActiveRecord::Base
  belongs_to :user

  validates :username, presence: true, on: :update
  validates :username, uniqueness: true, on: :update
  validates :user, presence: true
end
