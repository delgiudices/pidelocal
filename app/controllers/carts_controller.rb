class CartsController < ApplicationController
  layout 'store'
  before_action :authenticate_user!, only: [:checkout]

  def show
    @store = store
    @cart = get_cart
  end

  def update
    cart_action = params[:cart_action]
    product = CartItem.find(params[:product])
    if cart_action == 'refresh'
      product.quantity = params[:quantity]
      product.save
      flash[:notice] = "El carrito fue actualizado exitosamente"
      redirect_to cart_path
    elsif
      product.destroy
      flash[:notice] = "El articulo fue removido exitosamente"
      redirect_to cart_path
    end
  end

  def checkout
    @store = store
    @shipping_address = ShippingAddress.new
    @shipping_addresses = ShippingAddress.where(user_id: current_user.id)
  end

  def review_order
  end
end