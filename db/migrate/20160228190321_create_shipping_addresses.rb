class CreateShippingAddresses < ActiveRecord::Migration
  def change
    create_table :shipping_addresses do |t|
      t.string :name
      t.string :phone
      t.string :city
      t.string :address

      t.timestamps null: false
    end
  end
end
