class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :valid_user

  private

  def current_user
    User.find_by(id: session[:user_id])
  end

  def user_signed_in
    !!current_user
  end

  def valid_user
    redirect_to root_path unless user_signed_in
  end
end
