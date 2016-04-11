class LandmarksController < ApplicationController
  def index
    if params[:search]
      @landmarks = Landmark.search(params[:search]).page(params[:page]).per(5)
    else
      @landmarks = Landmark.order(:name).page(params[:page]).per(5)
    end
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

    def edit
      @landmark = Landmark.find(params[:id])
    end

    def update
      @landmark = Landmark.find(params[:id])
      @landmark.update(landmark_params)
      if @landmark.save
        flash[:notice] = "Landmark updated successfully!"
        redirect_to landmark_path(@landmark)
      else
        flash[:error] = "Update unsucessful. No changes were made."
        redirect_to edit_landmark_path(@landmark)
      end
    end

    def destroy
      @landmark = Landmark.find(params[:id])
      if @landmark.destroy
        flash[:notice] = "Landmark Deleted Successfully"
      end
      redirect_to landmarks_path
    end
  end

  private

  def landmark_params
    params.require(:landmark).permit(:name, :location, :image, :description)
  end
end
