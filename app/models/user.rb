class User < ActiveRecord::Base
  has_many :landmarks

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true
  validates :avatar_url, presence: true
end
