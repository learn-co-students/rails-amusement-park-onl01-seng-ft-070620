class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :signed_in?
  helper_method :current_user

  def current_user
    User.find_by(id: session[:user_id])
  end

  def signed_in?
    if session[:user_id]
      true
    else 
      false
    end
  end

  def nav_bar_2
    if signed_in?
      link_to "#{current_user.name}'s profile", user_path(current_user), class: "navbar-brand"
    else
      link_to "Sign Up", new_user_path, class: "navbar-brand"
    end
  end

  def nav_bar_3
    if signed_in?
      link_to "Log Out", logout_path, class: "navbar-brand"
    else
      link_to "Log In", signin_path, class: "navbar-brand"
    end
  end
end
