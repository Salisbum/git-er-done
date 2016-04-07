class ProfilesController < ApplicationController
  def show
    @profile = Profile.find(params[:id])
    @user = @profile.user
  end

  # def new
  #   @profile = current_user.build_profile
  # end
  #
  # def create
  #   @profile = current_user.build_profile(profile_params)
  #   if @profile.save
  #     flash[:success] = "Profile saved"
  #     redirect_to current_user_path
  #   else
  #     flash[:error] = "Error"
  #     render: new
  #   end
  # end

end
