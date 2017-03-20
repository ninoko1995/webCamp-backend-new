class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_correct_user,only:[:edit,:update]
  before_action :set_user,only: [:show,:follows,:followers]
  before_action :set_book
  
  def show
    @books = Kaminari.paginate_array(@user.books).page(params[:page])
  end

  def index
    @users = User.all
    @book = Book.new
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user),notice: 'Updated your information!' 
    else
      render :edit,notice: 'Failed to update, sorry.' 
    end
  end

  def followers
    @followers = @user.followers
  end

  def follows
    @follows = @user.followings
  end

##timeline機能は応用編であり、今回は課題としない
  def home
    @user = current_user
    @books = Book.new
    @user.followings.each do |user|
      @books = @books , user.books
    end
    @books = Kaminari.paginate_array(@books).page(params[:page])
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
