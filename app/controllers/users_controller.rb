class UsersController < ApplicationController
    before_action :logged_in, except: [:new, :create]

    def new 
        @user = User.new
    end 

    def create 
        if @user = User.create(user_params)
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
            # byebug
        else 
            render 'new'
        end 
    end 

    def show
        @user = User.find_by(id: params[:id])
    end 

    private 

    def user_params
        params.require(:user).permit(
            :name,
            :height,
            :nausea,
            :tickets,
            :admin,
            :password,
            :happiness
        )
    end 

end
