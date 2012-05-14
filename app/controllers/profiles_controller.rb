# coding: utf-8
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
    @profile = Profile.find(params[:id])

    if @profile.update_attributes(params[:profile])
      redirect_to root_path, notice: '个人资源修改成功'
    else
      render action: 'edit'
      flash[:error] = '个人资源修改不成功，请重新修改'
    end
  end

  protected

end
