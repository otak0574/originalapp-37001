class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.references :customer, foreign_key: true
      t.references :store, foreign_key: true
      t.timestamps
    end
  end
end
