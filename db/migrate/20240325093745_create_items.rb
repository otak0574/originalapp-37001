class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :details, null: false
      t.integer :price, null: false
      t.integer :sale_price
      t.string :category
      t.string :status, null: false
      t.integer :shelf_number, null: false
      t.references :store, foreign_key: true, null: false

      t.timestamps
    end
  end
end
