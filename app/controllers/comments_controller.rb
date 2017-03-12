class CommentsController < ApplicationController
	before_action :authenticate_user!
	def create
		@comment = Comment.create(book_id: params[:book_id],user_id: current_user.id,body: params[:comment][:body])
		redirect_to book_path(params[:book_id])
	end

	def destroy
		@comment = Comment.find(params[:id])
		correct_user?(@comment.user)
		@comment.destroy
		redirect_to book_path(params[:book_id])
	end
end
