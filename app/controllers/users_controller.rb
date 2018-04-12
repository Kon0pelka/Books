class UsersController < ApplicationController
  before_action :admin_user,     only: [:destroy, :show, :index]

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.page(params[:page]).per(10)
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private
  # Подтверждает наличие административных привилегий.
  def admin_user
    #debugger
      redirect_to(root_url) unless current_user.admin?
  end
end
