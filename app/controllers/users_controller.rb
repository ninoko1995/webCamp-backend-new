class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_correct_user,only:[:edit,:update]
  before_action :set_user,only: [:show,:follows,:followers]
  before_action :set_book
  
  def show
    @books = @user.books.order(updated_at: :desc)
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

  def followers
    @followers = @user.followers
  end

  def follows
    @follows = @user.followings
  end


  private
    def set_user
      @user = User.find(params[:id])
    end

    def set_book
      @book = Book.new
    end

    def user_params
       params.require(:user).permit(:name, :introduction,:image)
    end

    def check_correct_user
      set_user
      if !correct_user?(@user)
        render :show
      end
    end
end
