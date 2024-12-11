class SessionsController < ApplicationController
    before_action :require_no_user, only: %i[new create]

    def new
    end

    def create
        user = User.find_by_email(params[:email])
        if user.present? && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to root_path
        else
            redirect_to new_session_path
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to root_path
    end

end