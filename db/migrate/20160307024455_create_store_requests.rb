class CreateStoreRequests < ActiveRecord::Migration
  def change
    create_table :store_requests do |t|
      t.string :full_name
      t.string :phone
      t.string :email
      t.string :password
      t.string :store_name
      t.string :store_address
      t.string :store_phone

      t.timestamps null: false
    end
  end
end
