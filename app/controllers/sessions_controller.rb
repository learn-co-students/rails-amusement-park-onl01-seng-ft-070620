class SessionsController < ApplicationController
    skip_before_action :require_login, only: [:new, :create]

    def new
    end

    def create
        if user = User.find(params[:user][:name])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            render 'new'
        end
    end

    def destroy
        session.clear
        redirect_to root_path
    end
end
  