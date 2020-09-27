require 'pry'
class RidesController < ApplicationController   
    
    def create
        ride = Ride.create(ride_params)
        ride_result = ride.take_ride
        flash.alert = ride_result
        redirect_to user_path(current_user)
    end

    private

    def ride_params
        params.require(:ride).permit(:user_id, :attraction_id)
    end
end
