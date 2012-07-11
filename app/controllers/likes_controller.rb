class LikesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_likeable

  def create
    @like = current_user.like!(@target) if @target rescue ActiveRecord::RecordInvalid
    if @like.save
       @target.reload
    end
  end
 
  def destroy
    @like = current_user.like_for(@target) if @target rescue ActiveRecord::RecordInvalid
    @like.destroy
    @target.reload
  end

  private
  def find_likeable
    klass = params[:type].constantize
    @target = klass.find_by_id(params[:id])
  end

end
