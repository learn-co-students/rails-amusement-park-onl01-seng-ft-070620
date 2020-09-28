class AttractionsController < ApplicationController
    before_action :set_admin
    def index
        @attractions = Attraction.all
    end

    def show
        @attraction = Attraction.find params[:id]
    end

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

    def edit
        @attraction = Attraction.find params[:id]
    end

    def update
        @attraction = Attraction.find params[:id]
        if @attraction.update(attraction_params)
            redirect_to attraction_path(@attraction)
        else
            render 'edit'
        end
    end

    def ride
        ride = Ride.new(attraction_id: params[:attraction_id], user_id: current_user.id)
        session[:ride_message] = ride.take_ride
        redirect_to "/users/#{ride.user_id}"
    end

    private

    def set_admin
        @admin = current_user.admin
    end

    def attraction_params
        params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end
end