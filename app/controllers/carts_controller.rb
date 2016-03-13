class CartsController < ApplicationController
  layout 'store'
  before_action :authenticate_user!, only: [:checkout]

  def show
    @store = store
    @cart = get_cart
  end

  def checkout
    @store = store
    @cart = get_cart
    @shipping_address = ShippingAddress.new
    @shipping_addresses = ShippingAddress.where(user_id: current_user.id)
  end

  def review_order
    @store = store
    @cart = get_cart
    @shipping_address = ShippingAddress.find(params[:order][:shipping_address])
    @order = Order.from(cart: @cart, shipping_address: @shipping_address)
  end

  def add_item
    @cart = get_cart
    product = Product.find(params[:product_id])
    @cart.add(product, product.price, params[:quantity].to_i, name: product.name)
    flash[:notice] = "El Articulo fue agregado al carrito"
    redirect_to(controller: '/carts', action: 'show')
  end


end
