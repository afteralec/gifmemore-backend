class Api::V1::CartsController < ApplicationController
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

  def total 
    total = Cart.total(params[:item_ids])
    render json: total
  end

# if we want to handle POST and DELETE of join records in carts controller ALT would be to use the POST and DELETE in items_carts controller
  def add_item
    cart = self.current_user.cart
    ItemCart.create(cart: cart, item_id: cart_params[:item_id])
    render json: {items: cart.items}
  end

  def remove_item
    cart = self.current_user.cart
    item_cart = ItemCart.find_by(cart_id: cart.id, item_id: cart_params[:item_id])
    item_cart.destroy
    render json: {items: cart.items}
  end 

  private

  def cart_params
    params.require(:cart).permit(:item_id) 
  end
end
