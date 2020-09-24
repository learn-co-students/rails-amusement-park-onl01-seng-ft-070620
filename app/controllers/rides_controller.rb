class RidesController < ApplicationController
# POST /rides
  def create
    @ride = Ride.new(ride_params)
    if @ride.save
      flash[:alert] = @ride.take_ride
      redirect_to user_path(@ride.user)
    else
      flash[:alert] = "invalid ride"
    end
  end

  private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end
end
