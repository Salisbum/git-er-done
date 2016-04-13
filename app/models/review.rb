class Review < ActiveRecord::Base
  belongs_to :landmark
  belongs_to :user, dependent: :destroy

  validates :body, presence: true, length: { minimum: 1, maximum: 1000 }
  validates :user, presence: true
  validates :landmark, presence: true
  validates :votes, presence: true
  validates :landmark_review, inclusion: { in: %w(1 2 3 4 5) }
end
