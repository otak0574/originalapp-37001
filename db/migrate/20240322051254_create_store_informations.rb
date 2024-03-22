class CreateStoreInformations < ActiveRecord::Migration[7.0]
  def change
    create_table :store_informations do |t|
      t.string :business_hours, null: false
      t.string :details, null: false
      t.timestamps
      t.references :store, foreign_key: true, null: false
    end
  end
end
