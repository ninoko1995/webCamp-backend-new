class BooksController < ApplicationController
  before_action :set_book, only: [:show, :update, :destroy,:favors]
  before_action :authenticate_user!,only: [:create,:update,:destroy,:index]
  before_action :check_correct_user,only: [:update,:destroy]
  before_action :check_draft?,only: [:show]
  # GET /books
  # GET /books.json
  def index
    # 鍵アカ投稿非表示
     @books = []
     User.all.includes(:books).each do |user|
       if !user.locked
         @books = @books + user.books
       end
     end
     @books = Kaminari.paginate_array(@books.sort_by!{|book|book.created_at}).page(params[:page]) 
    
    
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @comments = @book.comments
    @user = @book.user
    accepted_user?(@user)
  end

  # POST /books
  # POST /books.json
  def create
    @book = current_user.books.build(book_params)
    if params[:commit] == 'Create Book' 
      @book.draft = false
    else
      @book.draft = true
    end
    if @book.save
      @book.book_types.create(type_params)
      if @book.draft
        redirect_to :back, notice: 'Book was successfully created as a draft.' 
      else
        redirect_to @book, notice: 'Book was successfully created.' 
      end
    else
      @books = Book.page(params[:page])
      render :index
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    if @book.update(book_params)
      @book.book_types.create(type_params)
      redirect_to @book, notice: 'Book was successfully updated.' 
    else
      render :edit
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @user = @book.user
    @book.destroy
    redirect_to @user, notice: 'Book was successfully destroyed.'
  end


  def favors
    @user = @book.user
    @favors = @book.favors
    accepted_user?(@user)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    def check_correct_user
      set_book
      @user = @book.user
      if !correct_user?(@user)
        render :show
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :body,:author,:valuation)
    end

    def type_params
      params.require(:book_type).permit(:type_id)
    end

    def check_draft?
      if @book.draft
        redirect_to :back
      end
    end
    
end
