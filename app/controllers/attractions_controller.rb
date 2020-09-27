class AttractionsController < ApplicationController
    def index
        @attractions = Attraction.all
    end
    
    def new

    end

    def create

    end

    def show
        @attraction = Attraction.find_by(id: params[:id])
    end
end
