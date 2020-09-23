class AttractionsController < ApplicationController
    def index
        @attractions = Attraction.all
    end

    def show
        @attraction = Attraction.find_by(id: params[:id])
    end

    def take_ride
        ride = Ride.create(user_id: current_user.id, attraction_id: params[:attraction_id])
        flash[:alert] = ride.take_ride
        redirect_to user_path(current_user)
    end
end
