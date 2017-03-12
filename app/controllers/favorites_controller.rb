class FavoritesController < ApplicationController
	before_action :authenticate_user!
	
	def create
		@favorite = Favorite.new(user_id: current_user.id,book_id: params[:book_id])
		@favorite.save
		redirect_to books_path
	end

	def destroy
		@favorite = Favorite.find(params[:id])
		@favorite.destroy
		redirect_to books_path
	end

	def index
		@user = User.find(params[:user_id])
		@books = Kaminari.paginate_array(@user.favorites.map{|favorite| favorite.book}).page(params[:page])
		@book = Book.new
	end
end
