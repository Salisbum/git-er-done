class Landmark < ActiveRecord::Base
  belongs_to :user
  has_many :reviews

  validates :name, presence: true
  validates :location, presence: true
  validates :image, presence: true
  validates :description, presence: true

  def self.search(search)
    where("name ILIKE ?", "%#{search}%")
  end
end
