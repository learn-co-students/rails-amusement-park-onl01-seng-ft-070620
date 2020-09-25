class AttractionsController < ApplicationController
    def index
        @attractions = Attraction.all
        @user = current_user
    end

    def show
        @attraction = Attraction.find(params[:id])
        @ride = @attraction.rides.build(user_id: current_user.id)
        @user = current_user
    end

    def new
        @attraction = Attraction.new
    end

    def create
        attraction = Attraction.create(attraction_params)
        redirect_to attraction_path(attraction)
    end

    def edit
        @attraction = Attraction.find(params[:id])
    end

    def update
        attraction = Attraction.find(params[:id])
        attraction.update(attraction_params)
        redirect_to attraction_path(attraction)
    end

    private

    def attraction_params
        params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
    end
end