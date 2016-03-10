class ShippingAddressController < ApplicationController

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
