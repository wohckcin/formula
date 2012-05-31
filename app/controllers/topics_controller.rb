class TopicsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :node, :recent, :show]
  load_and_authorize_resource only: [:new, :create, :edit, :preview, :update, :destroy, :favorite] 

  def index
    @topics = Topic.last_actived.includes(:node, :user).paginate(page: params[:page], per_page: 20)
  end

  def node
  end

  def recent
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def preview
  end

  def update
  end

  def destroy
  end

  def favorite
  end
end
