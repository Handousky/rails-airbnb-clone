class MealsController < ApplicationController
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
    @meals = Meal.where.not(latitude: nil, longitude: nil)

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
