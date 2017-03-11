class FavoritesController < ApplicationController
	before_action :authenticate_user!
	
	def create
		@favorite = Favorite.new(user_id: current_user.id,book_id: params[:book_id])
		@favorite.save
		redirect_to books_path
	end

	def destroy
		@favorite = Favorite.find_by(book_id: params[:book_id],user_id: current_user.id)
		@favorite.destroy
		redirect_to books_path
	end

	def index
		@user = User.find(params[:user_id])
		@favorites = @user.favorites
		@book = Book.new
	end
end
