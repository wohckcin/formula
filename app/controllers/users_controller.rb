class UsersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource :only => :index

  def index
    @users = User.all
  end

  def show
    @user = User.find(:first, conditions: { username: params[:id]})
    @topics = @user.topics.recent.limit(10)
  end

  private

  protected


end
