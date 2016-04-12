class ProfilesController < ApplicationController
  def show
    @profile = Profile.find(params[:id])
    @user = @profile.user
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
end
