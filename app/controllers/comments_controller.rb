class CommentsController < ApplicationController
  before_action :correct_user, only: [:destroy]

  def index
    @user = current_user
    @comments = @user.comments.where(activ: true).page(params[:page]).per(10)
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.book_id = params[:book_id]
    if @comment.save
      flash[:success] = "Comment created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @book = @comment.book
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.activ = false
    if @comment.update_attributes(comment_params)
      flash[:success] = "Comment updated"
      redirect_to comments_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @comment.destroy
    flash[:success] = "Comment deleted"
    redirect_to request.referrer || root_url
  end

  private

    def correct_user
      @comment = current_user.comments.find_by(id: params[:id])
      redirect_to root_url if @comment.nil?
    end

    def comment_params
      params.require(:comment).permit(:info)
    end
end
