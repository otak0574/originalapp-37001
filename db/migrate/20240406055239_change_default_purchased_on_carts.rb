class ChangeDefaultPurchasedOnCarts < ActiveRecord::Migration[7.0]
  def change
    change_column_default :carts, :purchased, from: nil, to: false
  end
end
