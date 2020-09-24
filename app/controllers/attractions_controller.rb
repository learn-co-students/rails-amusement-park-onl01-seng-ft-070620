class AttractionsController < ApplicationController
# GET /attractions
  def index
    @attractions = Attraction.all
  end

# GET /attractions/:id
  def show
    @attraction = Attraction.find_by(id: params[:id])
    @ride = @attraction.rides.build(user_id: current_user)
  end

# GET /attractions/new
  def new
    @attraction = Attraction.new
  end

# POST /attractions
  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      flash[:alert] = "invalid attraction"
      render 'new'
    end
  end

# GET /attractions/:id/edit
  def edit
    @attraction = Attraction.find_by(params[:id])
  end

# PATCH /attractions/:id
  def update
    @attraction = Attraction.find_by(params[:id])
    if @attraction.update(attraction_params)
      redirect_to attraction_path(@attraction)
    else
      flash[:alert] = "couldn't update"
      render 'edit'
    end
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :nausea_rating, :happiness_rating, :min_height, :tickets)
  end
end
