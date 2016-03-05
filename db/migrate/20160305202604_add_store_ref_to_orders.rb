class AddStoreRefToOrders < ActiveRecord::Migration
  def change
    add_reference :orders, :order, index: true, foreign_key: true
  end
end
