class AddStoreRefToAdminUser < ActiveRecord::Migration
  def change
    add_reference :admin_users, :store, index: true, foreign_key: true
  end
end
