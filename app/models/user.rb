class User < ActiveRecord::Base
  has_one :profile
  has_many :landmarks
  has_many :reviews, dependent: :destroy
  has_many :votes

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :build_default_profile

  def admin?
    role == "admin"
  end

  private

  def build_default_profile
    build_profile
    true
  end
end
