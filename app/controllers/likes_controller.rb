class LikesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_likeable

  def create
    @like = current_user.like!(@target) if @target rescue ActiveRecord::RecordInvalid
    @target.reload
  end
 
  def destroy
    @like = current_user.like_for(@target)
    @like.destroy
    @target.reload
  end

  private
  def find_likeable
    # @success = false
    # @element_id = "likeable_#{params[:type]}_#{params[:id]}"

    klass = params[:type].constantize
    @target = klass.find_by_id(params[:id])
  end

end
