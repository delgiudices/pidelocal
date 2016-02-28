class AddUserRefToShippingAddress < ActiveRecord::Migration
  def change
    add_reference :shipping_addresses, :user, index: true, foreign_key: true
  end
end
