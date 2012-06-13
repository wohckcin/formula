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
  end

  def update
  end

  def destroy
  end

  protected

  def find_topic
    @topic = Topic.find(params[:topic_id])
  end
end
