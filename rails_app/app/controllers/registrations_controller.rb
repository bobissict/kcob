class RegistrationsController < Devise::RegistrationsController
  def create
    super do |user|
      @profile = user.build_profile
      @profile.save
    end
  end

  protected

  def after_sign_up_path_for(resource)
    edit_profile_path(resource.profile)
  end
end
