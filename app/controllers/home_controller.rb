class HomeController < ApplicationController
  layout 'home.html.erb'
  before_action :log_in?

  def top
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
