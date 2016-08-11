class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def index
    @profiles = Profile.where(activated: true)
    respond_to do |format|
      format.html
      format.json { render :json => @profiles }
    end
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = current_user.profile
    @profile.activated = true
    if @profile.update(profile_params)
      render json: @profile, status: :updated, location: @profile
    else
      respond_with_errors(@profile)
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :year_matriculated,
                                    :city_id, :country_id, :industry_id, :company,
                                    :position, :facebook_url, :linkedin_url,
                                    :email)
  end
end
