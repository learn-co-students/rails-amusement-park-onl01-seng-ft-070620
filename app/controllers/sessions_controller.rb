class SessionsController < ApplicationController
    def signin
        @users = User.all
    end

    def destroy
        session.delete(:user_id)
        redirect_to root_path
    end

    def create
        @user = User.find_by(name: params[:user_name])
        if @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            @users = User.all
            render 'signin'
        end
    end

end