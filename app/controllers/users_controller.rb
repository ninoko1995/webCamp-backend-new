class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_correct_user,only:[:edit,:update,:requires]
  before_action :set_user,only: [:show,:follows,:followers,:requires,:favorites]
  before_action :set_book
  before_action -> {accepted_user?(@user)},only:[:show,:follows,:followers,:requires,:favorites]

  def index
    @users = User.all
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user),notice: 'Updated your information!' 
    else
      redirect_to user_path(@user) ,notice: 'Failed to update, sorry.' 
    end
  end

  def show
    @books = Kaminari.paginate_array(@user.books).page(params[:page])
    @now = 'books'
    render :layout => 'show'
  end

  def favorites
    @books = Kaminari.paginate_array(@user.favorite_books).page(params[:page])
    @now = 'favorites'
    render :layout => 'show'
  end

  def followers
    @followers = @user.followers
    @now = 'followers'
    render :layout => 'show'
  end

  def follows
    @follows = @user.followings
    @now = 'followings'
    render :layout => 'show'
  end

  def requires
    @requires =   @user.requires
    @now = 'requires'
    render :layout => 'show'
  end

  def home
    @user = current_user
    @books = []
    @user.followings.includes(:books).each do |user|
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
       params.require(:user).permit(:name, :introduction,:image,:locked,:header_image)
    end

    def check_correct_user
      set_user
      if !correct_user?(@user)
        redirect_to @user
      end
    end
end
