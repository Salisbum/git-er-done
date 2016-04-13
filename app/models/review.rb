class Review < ActiveRecord::Base
  belongs_to :landmark
  belongs_to :user, dependent: :destroy

  validates :body, presence: true, length: { minimum: 1, maximum: 1000 }
  validates :user, presence: true
  validates :landmark, presence: true
  validates :votes, presence: true
  validates :landmark_rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
end
