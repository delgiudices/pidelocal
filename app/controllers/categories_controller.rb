class CategoriesController < ApplicationController
  layout 'store'
  before_filter :set_store

  def show
    @products = Category.find_by(identifier: params[:id]).products
    render 'stores/show'
  end
end
