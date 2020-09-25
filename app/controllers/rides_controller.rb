class RidesController < ApplicationController
    def new
        
    end

    def create
      
        attraction = Attraction.find_by(id: params[:ride][:attraction_id])
        if current_user.height < attraction.min_height
            (flash[:message] ||= []) << "You are not tall enough to ride the #{attraction.name}"
        end
        if current_user.tickets < attraction.tickets
            (flash[:message] ||= []) << "You do not have enough tickets to ride the #{attraction.name}"
        end
        if flash[:message]
            return redirect_to user_path(current_user)
        end
        ride = Ride.new
        ride.attraction = attraction
        ride.user = current_user
        ride.save
        
        current_user.update(tickets: current_user.tickets - attraction.tickets,
        happiness: current_user.happiness + attraction.happiness_rating,
        nausea: current_user.nausea + attraction.nausea_rating
        )

        (flash[:message] ||= []) << "Thanks for riding the #{attraction.name}!"
        
        redirect_to user_path(current_user)
    end

    private

    # def ride_params
    #     params.require(:ride).permit(:name, :attraction_id)
    # end
end
