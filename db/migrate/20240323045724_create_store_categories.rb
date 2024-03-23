class CreateStoreCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :store_categories do |t|
      t.references :store, foreign_key: true, null: false
      t.references :category, foreign_key: true, null: false
      t.timestamps
    end
  end
end
