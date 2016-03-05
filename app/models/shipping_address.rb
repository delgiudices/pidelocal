class ShippingAddress < ActiveRecord::Base
  CITIES = ['Santo Domingo']
  validates_inclusion_of :city, in:  CITIES
  validates :city, presence: true
  validates :name, presence: true
  validates :phone, presence: true
  validates :user, presence: true
  validates :address, presence: true

  belongs_to :user

  def fee
    75.00
  end
end
