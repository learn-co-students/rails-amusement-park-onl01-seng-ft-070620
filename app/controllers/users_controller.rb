class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render 'new'
        end
        
    end

    def show
        @user = User.find params[:id]
        if session[:user_id] == nil
            redirect_to '/'
        end
    end

    def user_params
        params.require(:user).permit(:name, :height, :nausea, :happiness, :tickets, :password, :admin)
    end
end