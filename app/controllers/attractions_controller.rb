class AttractionsController < ApplicationController
    def index
        @attractions = Attraction.all
    end

    def show
        @attraction = Attraction.find_by(id: params[:id])
        @ride = Ride.new
    end

    def new
        admin_check
        @attraction = Attraction.new
    end

    def create
        admin_check
        @attraction = Attraction.new(attraction_params)
        if @attraction.save
            return redirect_to attraction_path(@attraction)
        else
            render :new
        end
    end

    def edit
        admin_check
        @attraction = Attraction.find_by(id: params[:id])
    end

    def update
        admin_check
        @attraction = Attraction.find_by(id: params[:id])
        if @attraction.update(attraction_params)
            return redirect_to attraction_path(@attraction)
        else
            render :edit
        end
    end

    private

    def attraction_params
        params.require(:attraction).permit(:name, :min_height, :tickets, :happiness_rating, :nausea_rating)
    end

    def admin_check
        if !current_user.admin
            return redirect_to user_path(current_user)
        end
    end

end
