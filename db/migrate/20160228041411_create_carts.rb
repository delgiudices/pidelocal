class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.string :session_id
      t.string :string

      t.timestamps null: false
    end
  end
end
