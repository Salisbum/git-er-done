class LandmarksController < ApplicationController
  def index
    @landmarks = Landmark.order(:name)
  end
end
