# coding: utf-8
class TopicsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :node, :recent, :show]
  before_filter :init_base_breadcrumb
  before_filter :set_menu_active
  load_and_authorize_resource only: [:new, :create, :edit, :preview, :update, :destroy, :favorite] 
  # after_filter :add_views_count, only: [:show]

  def index
    @topics = Topic.last_actived.includes(:node, :user).paginate(page: params[:page], per_page: 20)
    # drop_breadcrumb(t("topics.hot_topic"))
    set_seo_meta("","#{SITE_NAME}#{t("menu.topics")}")
  end

  def node
    @node = Node.find(params[:id])
    @topics = @node.topics.last_actived.includes(:user).paginate(page: params[:page], per_page: 20)
    drop_breadcrumb("#{@node.name}")
    set_seo_meta("#{@node.name}","#{SITE_NAME}#{t("menu.topics")}#{@node.name}",@node.description)
    render 'index'
  end

  def recent
  end

  def show
    @topic = Topic.includes(:user, :node).find(params[:id])
    @topic.visited
    @node = @topic.node
    @replies = @topic.replies.includes(:user)
    drop_breadcrumb("#{@node.try(:name)}", node_topics_path(@node.try(:id)))
    # drop_breadcrumb t("topics.read_topic")
    set_seo_meta("#{@topic.title}")
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
    drop_breadcrumb t("topics.post_topic")
    set_seo_meta("#{t("topics.post_topic")}")
  end

  def create
    pt = params[:topic]
    @topic = Topic.new(pt)
    @topic.user_id = current_user.id
    @topic.node_id = params[:node] || pt[:node_id]

    if @topic.save
      redirect_to(topic_path(@topic.id), notice: t('topics.create_topic_success'))
    else
      render action: 'new'
    end
  end

  def edit
    @topic = Topic.find(params[:id])
    @node = @topic.node
    drop_breadcrumb("#{@node.name}", node_topics_path(@node.id))
    drop_breadcrumb t("topics.edit_topic")
    set_seo_meta("#{t("topics.edit_topic")}")
  end

  def preview
  end

  def update
    @topic = Topic.find(params[:id])
    pt = params[:topic]
    @topic.node_id = pt[:node_id]
    @topic.title = pt[:title]
    @topic.content = pt[:content]

    if @topic.save
      redirect_to(topic_path(@topic.id), notice: t('topics.update_topic_success'))
    else
      render action: 'edit'
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to(topics_path, notice: t("topics.delete_topic_success"))
  end

  def favorite
  end

  protected

  def add_views_count
    @topic.visited
  end

  def set_menu_active
    @current = @current = ['/topics']
  end

  def init_base_breadcrumb
    drop_breadcrumb(t("menu.topics"), topics_path)
  end
end
