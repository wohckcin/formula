class TopicsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :node, :recent, :show]
  load_and_authorize_resource only: [:new, :create, :edit, :preview, :update, :destroy, :favorite] 
  # after_filter :add_views_count, only: [:show]

  def index
    @topics = Topic.last_actived.includes(:node, :user).paginate(page: params[:page], per_page: 20)
  end

  def node
  end

  def recent
  end

  def show
    @topic = Topic.without_content.includes(:user, :node).find(params[:id])
    @topic.visited
    @node = @topic.node
  end

  def new
    @topic = Topic.new
    if !params[:node].blank?
      @topic.node_id = params[:node]
      @node = Node.find_by_id(params[:node])
      if @node.blank?
        render_404
      end
      drop_breadcrumb("#{@node.name}", node_topics_path(@node.id))
    end
  end

  def create
    pt = params[:topic]
    @topic = Topic.new(pt)
    @topic.user_id = current_user.id
    @topic.node_id = params[:node] || pt[:node_id]

    if @topic.save
      redirect_to(topic_path(@topic.id), notice: t("topics.create_topic_success"))
    else
      render action: "new"
    end
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

  protected
  def add_views_count
    @topic.visited
  end
end
