# coding: utf-8
class UsersController < ApplicationController
  # before_filter :authenticate_user!
  before_filter :init_base_breadcrumb
  before_filter :set_menu_active
  load_and_authorize_resource :only => :index

  def index
    @users = User.all
  end

  def show
    @user = User.find(:first, conditions: { username: params[:id]})
    @topics = @user.topics.recent.limit(5)
    @replies = @user.replies.recent.includes(:topic).limit(10)
    drop_breadcrumb(@user.display_name)
    set_seo_meta("#{@user.display_name}")
  end

  private

  protected

  def set_menu_active
    @current = @current = ['/users']
  end

  def init_base_breadcrumb
    drop_breadcrumb( t("menu.users"), users_path)
  end

end
