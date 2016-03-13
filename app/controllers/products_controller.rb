class ProductsController < ApplicationController
  layout 'store'
  before_filter :set_store, only: [:show]

  def show
    @product = Product.find(params[:id])
  end

end
