class OrdersController < ApplicationController

  layout 'store'
  before_filter :authenticate_user!

  def place_order
    shipping_address = ShippingAddress.find(params[:shipping_address])
    @order = Order.from(
      cart: get_cart,
      shipping_address: shipping_address,
      billing_information: params[:billing_information])

    @order.user = current_user
    @order.store = store
    @order.place
    redirect_to order_path(id: params[:id], order_id: @order.id)
  end

  def show
    @store = store
    @order = Order.find_by!(id: params[:order_id], user_id: current_user.id, store_id: @store.id)
    @shipping_address = ShippingAddress.new
  end

end
