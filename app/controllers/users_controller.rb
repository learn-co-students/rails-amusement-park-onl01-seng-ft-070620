class UsersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]

# renders views/users/new with signup form
# also the root URL
  def new
    @user = User.new
  end

# catches POST request from signup form
# POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:alert] = "invalid signup information"
      redirect_to new_user_path
    end
  end

# shows a user's profile
# GET /user/:id
  def show
    @user = User.find_by(id: params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :nausea, :happiness, :tickets, :height, :admin, :password)
  end
end
