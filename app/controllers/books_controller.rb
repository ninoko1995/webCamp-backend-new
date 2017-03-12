class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy,:favors]
  before_action :authenticate_user!,only: [:create,:edit,:update,:destroy]

  # GET /books
  # GET /books.json
  def index
    @books = Book.page(params[:page])
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @comments = @book.comments
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    current_user.books.create(book_params)
    redirect_to user_path(current_user)
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    @book.update(book_params)
    redirect_to book_path(@book)
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    redirect_to books_path
  end


  def favors
    @favors = @book.favors
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :body)
    end
end
