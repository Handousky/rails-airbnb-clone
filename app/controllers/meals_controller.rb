class MealsController < ApplicationController
  before_action :set_meal, only: [:show, :edit, :update, :destroy]

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(meal_params)
    if @meal.save
      redirect_to meal_path(@meal)
    else
      render :new
    end
  end

  def index
    @meals = Meal.all
  end

  def show
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
    redirect_to root
  end

  private
  def set_meal
    @meal = Meal.find(params[:id])
  end

  def meal_params
    params.require(:meal).permit(:name, :price, :address, :category, :description)
  end
end
