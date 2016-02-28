class ShippingAddressesController < ApplicationController

  def create
    @shipping_address = ShippingAddress.new(shipping_address_params)
    @shipping_address.user_id = current_user.id
    @shipping_address.save
    redirect_to checkout_path(id: params[:id])
  end

  private

    def shipping_address_params
      params.require(:shipping_address).permit(:name, :phone, :address, :city)
    end
end
