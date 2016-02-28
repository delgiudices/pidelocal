class CartsController < ApplicationController
  layout 'store'

  def show
    @store = Store.find_by(identifier: params[:id])
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
end
