class OrdersController < ApplicationController
  def create
    @order = Order.new(user: current_user, meal: Meal.find(params[:id]))
    @order.status = "Pending"
    if @order.save
      redirect_to dashboard_path
    else
      redirect_to meal_path(@order.meal)
    end
  end

  def edit
  end

  def update
end
