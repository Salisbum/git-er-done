class ProfilesController < ApplicationController
  before_action :authorize_user, only: [:index]

  def index
    @profiles = Profile.all
  end

  def show
    @profile = Profile.find(params[:id])
    @user = @profile.user
  end

  def destroy
    profile = Profile.find(params[:id])
    user = profile.user
    reviews = user.reviews

    if profile.destroy && user.destroy
      reviews.each { |review| review.destroy }
      flash[:notice] = "Account Deleted Successfully!"
    else
      flash[:error] = "Account Not Deleted"
    end
    render :index
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      flash[:notice] = "Successfully edited your Profile!"
      redirect_to profile_path(@profile)
    else
      flash[:error] = "Did not manage to update profile. #{@profile.errors.full_messages.join(', ')}."
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(
      :username,
      :location,
      :pun,
      :avatar_url,
      :remove_avatar_url
    )
  end

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      redirect_to root_path
    end
  end
end
