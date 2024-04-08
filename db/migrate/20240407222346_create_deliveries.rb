class CreateDeliveries < ActiveRecord::Migration[7.0]
  def change
    create_table :deliveries do |t|
      t.references :address, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.references :deli_agent, null: false, foreign_key: true
      t.timestamps
    end
  end
end
