class StaticController < ApplicationController
    skip_before_action :valid_user, only: [:home]

    def home
    end
end
