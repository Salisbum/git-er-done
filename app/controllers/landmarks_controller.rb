class LandmarksController < ApplicationController
  def index
    @landmarks = Landmark.order(:name)
  end

  def show
    @landmark = Landmark.find(params[:id])
  end
end
