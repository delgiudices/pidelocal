class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.string :identifier

      t.timestamps null: false
    end
  end
end
