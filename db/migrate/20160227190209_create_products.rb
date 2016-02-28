class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.integer :quantity
      t.belongs_to :category
      t.belongs_to :store

      t.timestamps null: false
    end
  end
end
