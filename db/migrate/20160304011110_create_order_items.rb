class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.string :name, null: false
      t.decimal :price, null: false
      t.integer :quantity, null: false
      t.belongs_to :order, null: false
      t.timestamps null: false
    end
  end
end
