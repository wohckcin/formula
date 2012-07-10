class LikesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_target

  def create
  end
 
  def destroy
  end

  private
  def find_target
    @success = false
    @element_id = "likeable_#{params[:type]}_#{params[:id]}"
    if not params[:type].in?(['Topic','Reply'])
      render :text => "-1"
      return false
    end

    klass = params[:type].constantize
    @target = klass.find_by_id(params[:id])
    if @target.blank?
      render :text => "-2"
      return false
    end  
  end

end
