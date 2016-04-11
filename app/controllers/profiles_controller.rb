class ProfilesController < ApplicationController
  def show
    @profile = Profile.find(params[:id])
    @user = @profile.user
  end

  def index
    @profiles = Profile.all
  end
end
