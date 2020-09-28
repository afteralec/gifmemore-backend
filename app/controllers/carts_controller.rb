class CartsController < ApplicationController
  def index
    carts = Cart.all
    render json: carts
  end

  def show
    cart = Cart.find(params[:id])
    render json: cart
  end

  def create
    cart = Cart.create(cart_params)
    render json: cart
  end


    def create
        cart = Cart.create(cart_params)
        render json: cart
    end
  
# if we want to handle POST and DELETE of join records in carts controller ALT would be to use the POST and DELETE in items_carts controller
    def removeItem
        record = ItemCart.where(item_id: (params[:item_id]), cart_id: (params[:cart_id]))
        if record.destroy
            render json: {message: 'sucessfully removed item from cart'}
        else
            render json: {error: 'failed to remove item from cart'}
        end
    end 

    def addItem
        record = ItemCart.create(item_id: (params[:item_id]), cart_id: (params[:cart_id]))
        if record 
            render json: record 
        else 
            render json: {error: 'failed to add item from cart'}
        end
    end

  def update
    cart = Cart.find(params[:id])
    cart.update(cart_params)
    render json: cart
  end


  def destroy
    cart = Cart.find(params[:id])
    cart.destroy
  end

  private

  def cart_params
    params.require(:cart).permit(:user_id)
  end
end
