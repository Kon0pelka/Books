class BooksController < ApplicationController
  before_action :admin_user,     only: [:destroy]
  before_action :authenticate_user!,   only: [:show, :index]

  def show
    @book = Book.find(params[:id])
    @autor = @book.autor
    @comments = @book.comments.where(activ: true)
    @comment = current_user.comments.build
  end
  
  def new
    @book=Book.new
    @autors = Autor.all
  end

  def create
    @book = Book.new(book_params)
    @book.autor_id=params[:autor_id]
        if @book.save
          flash[:info] = "Book create!"
          redirect_to root_url
        else
          render 'new'
        end
  end

  def index
    @books = Book.page(params[:page]).per(12)
  end

  def destroy
    Book.find(params[:id]).destroy
    flash[:success] = "Book deleted"
    redirect_to home_url
  end

  private
  def book_params
    params.require(:book).permit(:name,:picture,:description)
  end
end
