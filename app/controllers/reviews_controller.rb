class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @review.landmark = landmark
    @review.user = current_user
    @user = landmark.user

    if @review.save
      UserMailer.new_review_notification_email(@user, landmark, @review).deliver_now
      flash[:notice] = 'Review successfully submitted!'
    else
      flash[:error] = "Review was not saved! #{@review.errors.full_messages.join ', '}."
    end
    redirect_to landmark_path(landmark)
  end

  def destroy
    landmark
    @review = Review.find(params[:id])
    if current_user == @review.user || current_user.admin?
      if @review.destroy
        flash[:notice] = "Review Deleted Successfully"
      end
    else
      flash[:notice] = "You cannot delete this review."
    end
    redirect_to landmark_path(@landmark)
  end

  def edit
    landmark
    @review = Review.find(params[:id])
  end

  def update
    landmark
    @review = Review.find(params[:id])
    if current_user == @review.user || current_user.admin?
      if @review.update(review_params)
        flash[:notice] = "Review updated!"
      else
        flash[:error] = "Review not saved! #{@review.errors.full_messages.join ', '}."
      end
      redirect_to landmark_path(landmark)
    else
      flash[:notice] = "You cannot edit this review."
      redirect_to landmark_path(@landmark)
    end
  end

  private

  def review_params
    params.require(:review).permit(
      :body,
      :landmark_rating
    )
  end

  def landmark
    @landmark ||= Landmark.find(params[:landmark_id])
  end
end
