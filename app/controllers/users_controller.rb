class UsersController < ApplicationController

    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def index
    end

    def show
        return redirect_to root_path unless logged_in?
    end

    def new
        @user = User.new
    end

    def create
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            redirect_to root_path
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :height, :tickets, :happiness, :nausea, :password, :admin)
    end

    def set_user
        @user = User.find_by(id: params[:id])
    end

end