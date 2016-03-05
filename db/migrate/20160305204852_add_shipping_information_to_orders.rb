class AddShippingInformationToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :address, :string
    add_column :orders, :name, :string
    add_column :orders, :phone, :string
    add_column :orders, :card_number_ending, :string
  end
end
