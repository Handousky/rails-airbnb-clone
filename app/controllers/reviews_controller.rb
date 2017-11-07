class ReviewsController < ApplicationController
  before_action :set_meal, only: [:new, :create]
  def new
    @review = Review.new
    @review.meal = @meal
  end

  def create
    @review = Review.new(review_params)
    @review.meal = @meal
    if @review.save
      redirect_to meal_path(@meal)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end

  def set_meal
    @meal = Meal.find(params[:meal_id])
  end
end
