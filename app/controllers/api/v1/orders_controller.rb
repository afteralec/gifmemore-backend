class Api::V1::OrdersController < ApplicationController
  def index
    orders = Order.all
    render json: orders
  end

  def show
    order = Order.find(params[:id])
    render json: order
  end
  
  def create
    order = Order.create(order_params)
    render json: order
  end
  

  def orderHistory 
      user = User.find(params[:user_id])
      orders = user.orders 
      render json: orders
  end

  private

  def order_params
    params.require(:order).permit(:name, :email, :amount, item_ids: [], address: {})
  end
end
