class LandmarksController < ApplicationController
  def index
    if params[:search]
      @landmarks = Landmark.search(params[:search]).page(params[:page]).per(5)
    else
      @landmarks = Landmark.order(:name).page(params[:page]).per(5)
    end
  end

  def show
    landmark
    @review = Review.new
    @vote_total = Vote.group(:review_id).sum(:vote)
    @average_rating = @landmark.reviews.average(:landmark_rating)
    @reviews = @landmark.reviews
  end

  def new
    @landmark = Landmark.new
  end

  def create
    @landmark = Landmark.new(landmark_params)
    @landmark.user = current_user
    if @landmark.save
      flash[:notice] = "Landmark added successfully!"
      redirect_to landmark_path(@landmark)
    else
      flash[:error] = "Landmark not added successfully! #{@landmark.errors.full_messages.join ', '}."
      render :new
    end
  end

  def edit
    @landmark = Landmark.find(params[:id])
  end

  def update
    landmark
    if current_user == @landmark.user || current_user.admin?
      if @landmark.update(landmark_params)
        flash[:notice] = "Landmark updated successfully!"
        redirect_to landmark_path(@landmark)
      else
        flash[:error] = "Update unsucessful. No changes were made."
        redirect_to edit_landmark_path(@landmark)
      end
    else
      flash[:notice] = "You cannot edit this landmark."
      redirect_to landmark_path(@landmark)
    end
  end

  def destroy
    landmark
    if current_user == @landmark.user || current_user.admin?
      if @landmark.destroy
        flash[:notice] = "Landmark Deleted Successfully"
      end
      redirect_to landmarks_path
    else
      flash[:notice] = "You cannot delete this landmark."
      redirect_to landmark_path(@landmark)
    end
  end

  private

  def landmark_params
    params.require(:landmark).permit(:name, :location, :image, :description)
  end

  def landmark
    @landmark ||= Landmark.find(params[:id])
  end
end
