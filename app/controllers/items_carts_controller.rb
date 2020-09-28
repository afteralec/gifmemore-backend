class ItemsCartsController < ApplicationController # end #     render json: carts #     carts = Cart.all # def index
  # def show
  #     cart = Cart.find(params[:id])
  #     render json: cart
  # end

  # def create
  #     cart = Cart.create(cart_params)
  #     render json: cart
  # end

  # def update
  #     cart = Cart.find(params[:id])
  #     cart.update(cart_params)
  #     render json: cart
  # end

  # def destroy
  #     cart = Cart.find(params[:id])
  #     cart.destroy
  # end

  # private
  # def cart_params
  #     params.require(:cart).permit(:user_id)
  # end
end
