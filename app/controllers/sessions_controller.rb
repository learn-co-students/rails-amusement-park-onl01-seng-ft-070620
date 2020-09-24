class SessionsController < ApplicationController
# GET /signin
  def new
    @users = User.all
    render 'signin'
  end

# POST /signin
  def create
    user = User.find_by(name: params[:name])
    user = user.try(:authenticate, params[:password])
		if user
      session[:user_id] = user.id
      @user = user
      redirect_to user_path(@user)
    else
      flash[:alert] = "invalid login credentials"
      redirect_to "/signin"
    end
  end

# POST /logout
  def destroy
    session.delete(:user_id)
    redirect_to '/'
  end
end
