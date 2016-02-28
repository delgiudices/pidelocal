class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def get_cart
    if session[:cart_id].nil?
      cart = Cart.create
      session[:cart_id] = cart.id
      return cart
    else
      return Cart.find(session[:cart_id])
    end
  end
end
