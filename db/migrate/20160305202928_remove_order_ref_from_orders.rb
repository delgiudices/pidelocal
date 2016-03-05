class RemoveOrderRefFromOrders < ActiveRecord::Migration
  def change
    remove_reference :orders, :order, index: true, foreign_key: true
  end
end
