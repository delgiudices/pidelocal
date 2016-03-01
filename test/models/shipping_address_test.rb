require 'test_helper'

class ShippingAddressTest < ActiveSupport::TestCase

  should validate_presence_of(:name)
  should validate_presence_of(:phone)
  should validate_presence_of(:user)
  should validate_presence_of(:address)
  should validate_presence_of(:city)
  should validate_inclusion_of(:city).
    in_array(ShippingAddress::CITIES)
   
end
