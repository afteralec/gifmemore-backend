class OrdersController < ApplicationController

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
        # added an instance method to create the entries for the ItemOrder table based off the ids we get from the front end --> will need to add them to the body of the request
        itemIds = params[:itemIds]
        order.addToOrder(itemIds)
        # think we should add serializer for order
        render json: order
    end

    def orderHistory 
        user = User.find(params[:user_id])
        orders = user.orders 
        render json: orders
    end

    # def update
    #     order = Order.find(params[:id])
    #     order.update(order_params)
    #     render json: order
    # end

    private
    def order_params
        params.require(:order).permit(:name, :dob, :email, :address, :password)
    end
end
