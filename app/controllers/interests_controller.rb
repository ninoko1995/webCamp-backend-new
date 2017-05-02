class InterestsController < ApplicationController
  def new
  end

  def create
  	p = params[:interest][:type_id]
  	if !p.blank? && current_user.interests.find_by(type_id: p).blank?
  		current_user.interests.create(type_id: p)
  	end
  	redirect_to :back
  end

  def destroy
  	Interest.find(params[:id]).destroy
  	redirect_to :back
  end

end
