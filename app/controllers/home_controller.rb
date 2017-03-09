class HomeController < ApplicationController
  def top
  	@name = 'Ninomiya'
  	@user = User.new
  end
end
