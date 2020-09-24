class AttractionsController < ApplicationController
    
    def new
        @attraction = Attraction.new
    end

    def create
        @attraction = Attraction.new(attraction_params)
        if @attraction.save
            redirect_to attraction_path(@attraction)
        else
            render 'new'
        end
    end
    
    def index
        @attractions = Attraction.all
    end

    def show
        @attraction = Attraction.find_by(id: params[:id])
    end

    def edit
        @attraction = Attraction.find_by(id: params[:id])
    end

    def update
        @attraction = Attraction.find_by(id: params[:id])
        if @attraction.update(attraction_params)
            redirect_to attraction_path(@attraction)
        else
            render 'edit'
        end
    end

    def take_ride
        ride = Ride.create(user_id: current_user.id, attraction_id: params[:attraction_id])
        flash[:alert] = ride.take_ride
        redirect_to user_path(current_user)
    end

    private

    def attraction_params
        params.require(:attraction).permit(:name, :ticket, :nausea_rating, :happiness_rating, :min_height)
    end

end
