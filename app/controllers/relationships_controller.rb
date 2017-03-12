class RelationshipsController < ApplicationController
 before_action :authenticate_user!

  def create
      current_user.active_relationships.create(followed_id: params[:user_id])
      redirect_to :back
  end

  def destroy
      current_user.active_relationships.find_by!(followed_id: params[:user_id]).destroy
      redirect_to :back
  end
end
