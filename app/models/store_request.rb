class StoreRequest < ActiveRecord::Base

  validates_presence_of :full_name, :store_name, :store_address, :email, :password, :phone, :store_phone

end
