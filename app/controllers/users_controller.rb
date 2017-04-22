class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_correct_user,only:[:edit,:update,:requires]
  before_action :set_user,only: [:show,:follows,:followers,:requires]
  before_action :set_book
  before_action -> {accepted_user?(@user)},only:[:show,:follows,:followers,:requires]
  
  def show
    @books = Kaminari.paginate_array(@user.books).page(params[:page])
  end

  def index
    @users = User.all
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

  def requires
    @requires =   @user.requires
  end

##timeline機能は応用編であり、今回は課題としない
  def home
    @user = current_user
    @books = []
    @user.followings.each do |user|
      @books = @books + user.books
    end
    @books = Kaminari.paginate_array(@books.sort_by!{|book|book.created_at}).page(params[:page])
  end


  private
    def set_user
      @user = User.find(params[:id])
    end

    def set_book
      @book = Book.new
    end

    def user_params
       params.require(:user).permit(:name, :introduction,:image,:locked)
    end

    def check_correct_user
      set_user
      if !correct_user?(@user)
        render :show
      end
    end
end
