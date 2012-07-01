# coding: utf-8
class RepliesController < ApplicationController

  before_filter :authenticate_user!
  before_filter :find_topic

  load_and_authorize_resource

  def create
    @reply = @topic.replies.build(params[:reply])
    @reply.user_id = current_user.id
    if @reply.save
      find_topic
      @msg = t("topics.reply_success")
    else
      @msg = @reply.errors.full_messages.join("<br />")
    end
  end

  def edit
    @reply = Reply.find(params[:id])
  end

  def update
    @reply = Reply.find(params[:id])
    if @reply.update_attributes(params[:reply])
      redirect_to(topic_path(@reply.topic_id), notice: '回帖更新成功')
    else
      render 'edit'
    end
  end

  def destroy
  end

  protected

  def find_topic
    @topic = Topic.find(params[:topic_id])
  end
end
