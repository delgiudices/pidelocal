class StoreRequestsController < ApplicationController

  def new
    @store_request = StoreRequest.new
  end

  def create
    store_request = StoreRequest.new store_request_params
    if store_request.save
      StoreNotifier.create_store_request_email(store_request).deliver
      redirect_to store_request_successful_path
    else
      render "new"
    end
  end

  def store_request_successful
  end

  def store_request_params
    params.require(:store_request).permit(:full_name, :email, :store_name, :phone, :store_phone, :password, :store_address)
  end


end
