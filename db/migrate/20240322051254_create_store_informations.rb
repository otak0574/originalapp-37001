class CreateStoreInformations < ActiveRecord::Migration[7.0]
  def change
    create_table :store_informations do |t|
      t.integer :business_hours_start_id, null: false
      t.integer :business_hours_end_id, null: false
      t.string :details, null: false
      t.timestamps
      t.references :store, foreign_key: true, null: false
    end
  end
end
