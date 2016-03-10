class CartItemsController < ApplicationController

  def destroy
    CartItem.find(params[:item_id]).delete
    redirect_to cart_path(store.identifier)
    flash[:notice] = "El articulo fue eliminado del carrito"
  end
end
