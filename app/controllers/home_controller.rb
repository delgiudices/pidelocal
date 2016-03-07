class HomeController < ApplicationController
  def index
  end

  def store_request
    @store_request = StoreRequest.new
  end

  def create_store_request
    store_request_params = params.require(:store_request).permit(:full_name, :email, :store_name, :phone, :store_phone, :password, :store_address)
    store_request = StoreRequest.new store_request_params
    if store_request.save
      byebug
      StoreNotifier.create_store_request_email(store_request).deliver
      redirect_to store_request_successful_path
    end
  end

  def store_request_successful
  end
end
