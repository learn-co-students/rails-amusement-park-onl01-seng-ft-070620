class RidesController < ApplicationController
    def new
        binding.pry
    end

    def create
        ride = Ride.create(ride_params)
        binding.pry
        ride.take_ride
        redirect_to user_path(current_user)
    end

    private

    def ride_params
        params.require(:ride).permit(:user_id, :attraction_id)
    end
end
