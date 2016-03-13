class CartItemsController < ApplicationController

  before_filter :set_store

  def destroy
    CartItem.find(params[:id]).delete
    redirect_to store_cart_path(@store.identifier)
    flash[:notice] = "El articulo fue eliminado del carrito"
  end
end
