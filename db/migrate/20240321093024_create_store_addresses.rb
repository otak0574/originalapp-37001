class CreateStoreAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :store_addresses do |t|
      t.string :postal_code, null: false
      t.integer :pref_id, null: false
      t.string :address, null: false
      t.string :phone_number, null: false
      t.references :store, foreign_key: true, null: false
      t.float      :latitude
      t.float      :longitude
      t.timestamps
    end
  end
end
