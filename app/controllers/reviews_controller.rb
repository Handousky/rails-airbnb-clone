class ReviewsController < ApplicationController
def create
    @review = Review.new(reviews_params)
    @review.meal = Meal.find(params[:meal_id])
    if @review.save
      redirect_to meal_path(@review.meal)
    else
      render 'meals/show', locals: { id: @review.meal.id }
    end
  end

  private
  def reviews_params
    params.require(:review).permit(:comment, :rating)
  end
end
