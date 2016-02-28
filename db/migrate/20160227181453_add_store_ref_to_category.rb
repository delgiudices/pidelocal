class AddStoreRefToCategory < ActiveRecord::Migration
  def change
    add_reference :categories, :store, index: true, foreign_key: true
  end
end
