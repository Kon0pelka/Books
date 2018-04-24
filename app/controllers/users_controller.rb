class UsersController < ApplicationController
  before_action :user_signed, only: [:destroy, :show, :index, :update, :add_book]
  before_action :admin_user,      only: [:destroy, :show, :index, :update,:set_destroy_admin]

  def show
    @user = User.find(params[:id])
    #debugger
    @books = @user.books  
  end

  def index
    @users = User.page(params[:page]).per(10)
  end

  def edit
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  def all_comment_moderation
    @comments = Comment.where(activ:false).page(params[:page]).per(15)
  end

  def moderation
    @comment = Comment.find(params[:id])
    @comment.moder;
    redirect_back(fallback_location: root_path)
  end

  def add_book
    @book = Book.find(params[:id])
    if (InterimTable.where(book_id:@book.id, user_id:current_user.id).empty?)
      InterimTable.create!(book_id:@book.id, user_id:current_user.id)
    else
      InterimTable.find_by(book_id:@book.id,user_id:current_user.id).destroy
    end
    redirect_back(fallback_location: root_path)
  end

  def set_destroy_admin
    @user = User.find(params[:id])
    if (@user.admin?)
      @user.del_admin
    else 
      @user.set_admin
    end
    redirect_to users_url
  end

  private
    def admin_user
        redirect_to(root_url) unless current_user.admin?
    end
    
    def user_signed
      redirect_to(root_url) unless user_signed_in?
    end
end
