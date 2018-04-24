class AutorsController < ApplicationController
    before_action :admin_user,     only: [:new, :create]
    def index
    end
    def new
        @autor = Autor.new
    end
    def create
        @autor = Autor.new(autor_params)
        if @autor.save
          flash[:info] = "Autor create!"
          redirect_to root_url
        else
          render 'new'
        end
    end
    private
    def autor_params
        params.require(:autor).permit(:second_name, :first_name)
    end

    def admin_user
        redirect_to(root_url) unless current_user.admin?
    end
end
