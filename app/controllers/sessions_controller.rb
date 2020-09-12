class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(name: params[:user][:name])
        if user && !user.nil?
            return redirect_to signin_path unless user.authenticate(params[:user_password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            redirect_to signin_path
        end
    end

    def destroy
        session.delete :user_id 
        redirect_to root_path
    end

end