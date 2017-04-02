class RelationshipsController < ApplicationController
 before_action :authenticate_user!

  def create
  		if Relationship.find_by(follower_id: current_user.id ,followed_id: params[:user_id]).blank?
      	@relationship = current_user.active_relationships.new(followed_id: params[:user_id])
        if User.find_by(id: params[:user_id]).locked
          @relationship.accepted = false
        else
          @relationship.accepted = true
        end
        if @relationship.save
          redirect_to :back,notice: "you have successfully followed!" 
        else
          redirect_to :back,notice: "you failed to follow this account"
        end
      else
      	redirect_to :back,notice: 'you already follow this account!'
      end
  end

  def destroy
  		@relationship = Relationship.find_by(id: params[:id])
      if !@relationship.blank?
      	@relationship.destroy
        redirect_to :back
      else
      	redirect_to :back,notice: "You don't follow this account!"
      end
  end

  def accept
  	@request = Relationship.find_by(id: params[:id],accepted: false)
  	if !@request.blank?
  		@request.update(accepted: true)
      redirect_to :back
  	else
  		redirect_to :back,notice: "this account doesn't request to follow you" 
  	end
  end
end
