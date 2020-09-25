class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login
  skip_before_action :require_login, only: [:home]

  def home
    
  end

  private
  
  def require_login
    redirect_to root_path if !self.helpers.logged_in?
  end

  def current_user
    User.find_by(id: session[:user_id])
  end
end
