class ProfilesController < ApplicationController
  def show
    @profile = Profile.find(params[:id])
    @user = @profile.user
  end

  def index
    @profiles = Profile.all
  end

  def destroy
    profile = Profile.find(params[:id])
    user = profile.user

    if profile.destroy && user.destroy
      flash[:notice] = "Account Deleted Successfully"
    else
      flash[:error] = "Account Not Deleted"
    end
    render :index
  end
end
