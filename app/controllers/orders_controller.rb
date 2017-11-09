class OrdersController < ApplicationController
  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.meal = Meal.find(params[:meal_id])
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

  private

  def order_params
    params.require(:order).permit(:time, :portions)
  end

end
