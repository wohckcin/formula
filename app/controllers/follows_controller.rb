class FollowsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_followable

  def create
    current_user.follow(@target) if @target rescue ActiveRecord::RecordInvalid
  end

  def destroy
    current_user.stop_following(@target) if @target rescue ActiveRecord::RecordInvalid
  end

  private
  def find_followable
    klass = params[:type].constantize
    @target = klass.find_by_id(params[:id])
  end
end