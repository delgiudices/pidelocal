class ShippingAddressesController < ApplicationController

  def create
    @shipping_address = ShippingAddress.new(shipping_address_params)
    @shipping_address.user_id = current_user.id
    if @shipping_address.save
      flash[:notice] = "La dirección fue creada"
      redirect_to checkout_path(id: params[:id])
    else
      flash[:alert] = "La dirección no fue creada"
      redirect_to checkout_path(id: params[:id])
    end
  end

  def shipping_address_params
    params.require(:shipping_address).permit(:name, :phone, :address, :city)
  end

  def fee
    the_fee = {
      :fee => 75.00,
      :city => params[:location],
    }

    respond_to do |format|
      format.json { render :json => the_fee }
    end
  end

end
