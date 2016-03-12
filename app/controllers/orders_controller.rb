class OrdersController < ApplicationController

  layout 'store'
  before_filter :authenticate_user!
  before_filter :set_store, only: [:show, :index]

  def index
    @orders = Order.for_store(@store, and_user: current_user)
  end

  def place_order
    shipping_address = ShippingAddress.find(params[:shipping_address])
    @order = Order.from(
      cart: get_cart,
      shipping_address: shipping_address,
      billing_information: params[:billing_information])

    @order.user = current_user
    @order.store = store
    @order.place
    flash[:notice] = "La orden fue colocada exitosamente"
    redirect_to order_path(id: params[:id], order_id: @order.id)
  end

  def show
    @order = Order.find_by!(id: params[:id], user_id: current_user.id, store_id: @store.id)
    @shipping_address = ShippingAddress.new
  end

end
