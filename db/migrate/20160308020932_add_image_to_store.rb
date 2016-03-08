class AddImageToStore < ActiveRecord::Migration
  def change
    add_attachment :stores, :logo
  end
end
