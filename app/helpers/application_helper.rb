module ApplicationHelper
    def user_welcome
        if current_user
            "Hey, #{current_user.name}!"
        else
            flash[:alert]
        end
    end

end
