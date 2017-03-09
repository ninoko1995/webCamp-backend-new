class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user,only: [:show,:edit,:update]
  
  def show
    @books = @user.books
  end

  def index
    @users = User.all
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
       params.require(:user).permit(:name, :introduction,:image)
    end
end
