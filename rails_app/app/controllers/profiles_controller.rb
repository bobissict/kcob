# == Schema Information
#
# Table name: profiles
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  first_name        :string
#  last_name         :string
#  year_matriculated :integer
#  city              :integer
#  country           :integer
#  industry_id       :integer
#  company           :string
#  position          :string
#  facebook_url      :string
#  linkedin_url      :string
#  email             :string
#  activated         :boolean          default(FALSE)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  house             :string
#

class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def index
    @profiles = Profile.where(activated: true)
    respond_to do |format|
      format.html
      format.json { render :json => @profiles }
    end
  end

  def show
    @profile = Profile.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    invalid_request
  end

  def edit
    @profile = Profile.find(params[:id])
    if @profile != current_user.profile
      invalid_request
    end
  rescue ActiveRecord::RecordNotFound
    invalid_request
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      render json: @profile
    else
      respond_with_errors(@profile)
    end
  end

  private

  def invalid_request
    flash[:notice] = "Invalid profile ID"
    redirect_to :action => 'index'
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :year_matriculated,
                                    :city, :country, :industry_id, :company,
                                    :position, :facebook_url, :linkedin_url,
                                    :email)
  end
end
