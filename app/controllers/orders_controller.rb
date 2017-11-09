class OrdersController < ApplicationController
  def create
    @order = Order.new(order_params)
    @order.time += ' - ' + Date.today.strftime('%A, %b %d')
    @order.user = current_user
    @order.meal = Meal.find(params[:meal_id])
    @order.status = "Pending"
    if @order.save
      redirect_to dashboard_path
    else
      render meal_path(@order.meal)
    end
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(status_params)
      redirect_to dashboard_path
    else
      render dashboard_path
    end
  end

  private

  def order_params
    params.require(:order).permit(:time, :portions)
  end

  def status_params
    params.require(:order).permit(:status)
  end

end
