class BookTypesController < ApplicationController
	def destroy
		BookType.find(params[:id]).destroy
		redirect_to :back
	end

	def search
		@type = Type.find_by(id: params[:book_type][:type_id])
		if !@type.blank?
			@books = Kaminari.paginate_array(@type.books).page(params[:page]) 
		else
			@books = Kaminari.paginate_array(Book.all).page(params[:page]) 
		end
    render 'books/index'
	end

	 private
  
    def book_type_params
      params.require(:book_type).permit(:type_id)
    end

end
