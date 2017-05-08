class InterestsController < ApplicationController
  def create
    #binding.pry
  	current_user.interests.create(interest_params)
    redirect_to :back
  end

  def destroy
  	Interest.find(params[:id]).destroy
  	redirect_to :back
  end

  def search
    @type = Type.find_by(id: params[:interest][:type_id])
    if !@type.nil?
      @users = @type.users
    else
      @users = User.all
    end
    render 'users/index'
  end


  private
  
    def interest_params
      params.require(:interest).permit(:type_id)
    end

end
