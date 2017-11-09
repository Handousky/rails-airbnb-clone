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

  def edit
    @order = Order.find(params[:id])
  end

  def accept
    @order = Order.find(params[:id])
    @order.update(status: "Accepted")
    redirect_to dashboard_path
  end

  def reject
    @order = Order.find(params[:id])
    @order.update(status: "Rejected")
    redirect_to dashboard_path
  end

  private

  def order_params
    params.require(:order).permit(:time, :portions)
  end
end
