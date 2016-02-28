class ProductsController < ApplicationController
  layout 'store'

  def show
    @store = Store.find_by(identifier: params[:id])
    @product = Product.find(params[:product_id])
  end

  def add_to_cart
    @cart = get_cart
    product = Product.find(params[:product_id])
    @cart.add(product, product.price, params[:quantity].to_i, name: product.name)
    flash[:notice] = "El Articulo fue agregado al carrito"
    redirect_to(controller: '/carts', action: 'show')

  end


end
