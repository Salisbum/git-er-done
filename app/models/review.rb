class Review < ActiveRecord::Base
  belongs_to :landmark
  belongs_to :user, dependent: :destroy
  has_many :votes

  validates :body, presence: true, length: { minimum: 1, maximum: 1000 }
  validates :user, presence: true
  validates :landmark, presence: true
end
