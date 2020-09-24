class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  private

  def current_user
    session[:user_id] ||= nil
  end

  def require_login
    redirect_to '/' unless current_user
  end
end
