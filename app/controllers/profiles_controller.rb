class ProfilesController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = User.find(params[:id])
    @profile = @user.profile
  end

  def edit
    @user = current_user
    @profile = @user.profile
  end

  def update
    @profile_attrs = params[:profile] || {}

    if current_user.update_profile(@profile_attrs)
      flash[:notice] = t('profiles.update.updated')
    else
      flash[:error] = t('profiles.update.failed')
    end
  end

  protected

end
