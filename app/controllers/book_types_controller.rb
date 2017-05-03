class BookTypesController < ApplicationController
	def destroy
		BookType.find(params[:id]).destroy
		redirect_to :back
	end
end
