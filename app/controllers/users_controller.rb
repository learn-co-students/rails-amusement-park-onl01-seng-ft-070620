class UsersController < ApplicationController
    skip_before_action :require_login, only: [:new, :create]
    def new
        @user = User.new
    end

    def create
        user = User.create(user_params)
        if user.save
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            render 'new'
        end
    end

    def show
        redirect_to root_path if !self.helpers.logged_in?
        @user = User.find(params[:id])
        @user_mood = @user.mood
    end

    private

    def user_params
        params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
    end

    # def admin_params
    #     params.require(:user).permit(:name, :admin, :password)
    # end

end
  