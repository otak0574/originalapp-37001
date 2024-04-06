class AddPurchasedToCarts < ActiveRecord::Migration[7.0]
  def change
    add_column :carts, :purchased, :boolean, default: false
  end
end
