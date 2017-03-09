class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  
  def show
    @books = @user.books
  end

  def edit
  end

  def edit
  end

  def index
  end

  def update
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
end
