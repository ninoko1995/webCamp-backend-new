class FavoritesController < ApplicationController
	before_action :authenticate_user!
	after_action ->{accepted_user?(User.find_by(params[:user_id]))},only: [:index]
	
	def create
		@favorite = Favorite.new(user_id: current_user.id,book_id: params[:book_id])
		@favorite.save
		redirect_to :back
	end

	def destroy
		@favorite = Favorite.find_by(user_id:current_user.id,book_id:params[:book_id])
		@favorite.destroy
		redirect_to :back
	end

	def index
		@user = User.find(params[:user_id])
		@books = Kaminari.paginate_array(@user.favorites.map{|favorite| favorite.book}).page(params[:page])
		@book = Book.new
	end
end
