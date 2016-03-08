class CategoriesController < ApplicationController
  layout 'store'

  def show
    @store = Store.find_by(identifier: params[:id])
    @products = Category.find_by(identifier: params[:category_id]).products
    render 'stores/show'
  end
end
