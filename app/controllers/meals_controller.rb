class MealsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_meal, only: [:edit, :update, :destroy]

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(meal_params)
    @meal.user = current_user
    if @meal.save
      redirect_to meal_path(@meal)
    else
      render :new
    end
  end

  def index
   if params[:search].present?

      @meals = Meal.near(params[:search], 10)
      @results = Geocoder.coordinates(params[:search])
      # if params address
      # geocode that address
      # find meals near geocoded address
      # else do
    else
      @meals = Meal.where.not(latitude: nil, longitude: nil)
    end

    @hash = Gmaps4rails.build_markers(@meals) do |meal, marker|
      marker.lat meal.latitude
      marker.lng meal.longitude
      # marker.infowindow render_to_string(partial: "/meals/map_box", locals: { meal: meal })
    end
  end

  def show
    @meal = Meal.find(params[:id])
    @meal_coordinates = { lat: @meal.latitude, lng: @meal.longitude }
    @review = Review.new
  end

  def edit
  end

  def update
    if @meal.update(meal_params)
     redirect_to meal_path(@meal)
    else
      render :new
    end
  end


  def destroy
    @meal.destroy
    redirect_to dashboard_path
  end

  private
  def set_meal
    @meal = Meal.find(params[:id])
    if current_user != @meal.user
      redirect_to root_path
    end
  end

  def meal_params
    params.require(:meal).permit(:name, :price, :address, :category, :description, :photo)
  end
end
