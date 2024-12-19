class UsersController < ApplicationController
    before_action :require_no_user, only: %i[new create]
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def profile
        @user = User.find(params[:id])
        @posts = @user.posts.order(created_at: :desc)
    end
    private
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end