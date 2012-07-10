class LikesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_likeable

  def create
    @like = current_user.like!(@target) if @target rescue ActiveRecord::RecordInvalid
  end
 
  def destroy
    @like = Like.find_by_id_and_user_id!(params[:id], current_user.id)
    @like.destroy
  end

  private
  def find_likeable
    # @success = false
    @element_id = "likeable_#{params[:type]}_#{params[:id]}"

    klass = params[:type].constantize
    @target = klass.find_by_id(params[:id])
  end

end
