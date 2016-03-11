class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :get_cart, :store

  def get_cart
    if session[:cart_id].nil?
      cart = Cart.create
      session[:cart_id] = cart.id
      return cart
    else
      cart = Cart.find_by_id(session[:cart_id])
      if cart.present?
        return cart
      else
        session[:cart_id] = nil
        return get_cart
      end
    end
  end

  def store
    Store.find_by(identifier: params[:id])
  end


  protected
  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to store_path(store.identifier, next: request.fullpath), notice: 'Debe iniciar sesión'
    end
  end
end
