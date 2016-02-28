class StoresController < ApplicationController
  layout "store"

  def show
      @store = Store.find_by(identifier: params[:id])
      @products = Product.where(store: @store)
  end

end
