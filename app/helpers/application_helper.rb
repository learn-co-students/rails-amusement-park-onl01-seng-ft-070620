module ApplicationHelper
# returns the current user instance
  def get_current_user
    User.find_by(id: current_user) if current_user
  end
end
