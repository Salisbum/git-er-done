class Landmark < ActiveRecord::Base
  belongs_to :user
  has_many :reviews

  validates :name, presence: true
  validates :location, presence: true
  validates :image, presence: true
  validates :description, presence: true
  validates :user, presence: true
  validates :average_review, inclusion: { in: %w(0 1 2 3 4 5) }

  def self.search(search)
    where("name ILIKE ?", "%#{search}%")
  end

  def average_rating
    reviews = self.reviews
    sum = 0
    number = reviews.count

    reviews.each do |review|
      sum += review.landmark_review.to_i
    end
    if sum != 0
      average = sum / number
      average.to_s
    else
      "0"
    end
  end
end
