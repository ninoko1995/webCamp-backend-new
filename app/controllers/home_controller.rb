class HomeController < ApplicationController
  before_action :log_in?

  def top
  	@name = 'Ninomiya'
  	@user = User.new
  end

  def about
  end

  private
	  def log_in?
	  	if !current_user.blank?
	  		redirect_to user_path(current_user)
	  	end
	  end
end
