class LandmarksController < ApplicationController
  def index
    @landmarks = Landmark.order(:name)
  end

  def show
    @landmark = Landmark.find(params[:id])
  end

  def new
    @landmark = Landmark.new
  end

  def create
    @landmark = Landmark.new(landmark_params)
    if @landmark.save
      flash[:notice] = "Landmark added successfully!"
      redirect_to landmark_path(@landmark)
    else
      flash[:error] = "You idiot! #{@landmark.errors.full_messages.join ", "}.
      What are you stupid?!"
      render :new
    end
  end

  private

  def landmark_params
    params.require(:landmark).permit(:name, :location, :image, :description)
  end
end
