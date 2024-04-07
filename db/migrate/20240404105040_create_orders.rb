class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :price  ,null: false
      t.references :customer, foreign_key: true
      t.references :store, foreign_key: true
      t.timestamps
    end
  end
end
