class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def home; end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def require_login
    if !current_user
    redirect_to '/', alert: "Sign Up"
    end
  end
end
