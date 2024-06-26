class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string     :postal_code,   null: false
      t.integer    :pref_id,    null: false
      t.string     :city
      t.string     :house_number
      t.string     :building_name
      t.string     :phone_number,    null: false
      t.float      :latitude
      t.float      :longitude
      t.references :customer, null: false, foreign_key: true
      t.timestamps
    end
  end
end
