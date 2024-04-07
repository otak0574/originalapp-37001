# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_04_07_122032) do
  create_table "active_storage_attachments", charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", charset: "utf8", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "addresses", charset: "utf8", force: :cascade do |t|
    t.string "postal_code", null: false
    t.integer "pref_id", null: false
    t.string "city"
    t.string "house_number"
    t.string "building_name"
    t.string "phone_number", null: false
    t.bigint "order_id", null: false
    t.bigint "customer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_addresses_on_customer_id"
    t.index ["order_id"], name: "index_addresses_on_order_id"
  end

  create_table "agent_addresses", charset: "utf8", force: :cascade do |t|
    t.string "postal_code", null: false
    t.integer "pref_id", null: false
    t.string "city"
    t.string "house_number"
    t.string "building_name"
    t.string "phone_number", null: false
    t.bigint "order_id", null: false
    t.bigint "deli_agent_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deli_agent_id"], name: "index_agent_addresses_on_deli_agent_id"
    t.index ["order_id"], name: "index_agent_addresses_on_order_id"
  end

  create_table "cart_items", charset: "utf8", force: :cascade do |t|
    t.bigint "cart_id"
    t.bigint "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "quantity", default: 1
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["item_id"], name: "index_cart_items_on_item_id"
  end

  create_table "carts", charset: "utf8", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "purchased", default: false
    t.index ["customer_id"], name: "index_carts_on_customer_id"
    t.index ["store_id"], name: "index_carts_on_store_id"
  end

  create_table "categories", charset: "utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", charset: "utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "nickname", null: false
    t.date "birth_date", null: false
    t.integer "gender_id", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "first_name_kana", null: false
    t.string "last_name_kana", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "deli_agents", charset: "utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "nickname", null: false
    t.date "birth_date", null: false
    t.integer "gender_id", null: false
    t.integer "phone_number", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "first_name_kana", null: false
    t.string "last_name_kana", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_deli_agents_on_email", unique: true
    t.index ["reset_password_token"], name: "index_deli_agents_on_reset_password_token", unique: true
  end

  create_table "item_tag_relations", charset: "utf8", force: :cascade do |t|
    t.bigint "item_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_item_tag_relations_on_item_id"
    t.index ["tag_id"], name: "index_item_tag_relations_on_tag_id"
  end

  create_table "items", charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.text "details", null: false
    t.integer "price", null: false
    t.integer "sale_price"
    t.string "category"
    t.string "status", null: false
    t.integer "shelf_number", null: false
    t.bigint "store_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_items_on_store_id"
  end

  create_table "orders", charset: "utf8", force: :cascade do |t|
    t.integer "price", null: false
    t.bigint "customer_id"
    t.bigint "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["store_id"], name: "index_orders_on_store_id"
  end

  create_table "store_addresses", charset: "utf8", force: :cascade do |t|
    t.string "postal_code", null: false
    t.integer "pref_id", null: false
    t.string "address", null: false
    t.string "phone_number", null: false
    t.bigint "store_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_store_addresses_on_store_id"
  end

  create_table "store_categories", charset: "utf8", force: :cascade do |t|
    t.bigint "store_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_store_categories_on_category_id"
    t.index ["store_id"], name: "index_store_categories_on_store_id"
  end

  create_table "store_informations", charset: "utf8", force: :cascade do |t|
    t.integer "business_hours_start_id", null: false
    t.integer "business_hours_end_id", null: false
    t.string "details", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "store_id", null: false
    t.index ["store_id"], name: "index_store_informations_on_store_id"
  end

  create_table "stores", charset: "utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_stores_on_email", unique: true
    t.index ["reset_password_token"], name: "index_stores_on_reset_password_token", unique: true
  end

  create_table "tags", charset: "utf8", force: :cascade do |t|
    t.string "tag_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_name"], name: "index_tags_on_tag_name", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "addresses", "customers"
  add_foreign_key "addresses", "orders"
  add_foreign_key "agent_addresses", "deli_agents"
  add_foreign_key "agent_addresses", "orders"
  add_foreign_key "cart_items", "carts"
  add_foreign_key "cart_items", "items"
  add_foreign_key "carts", "customers"
  add_foreign_key "carts", "stores"
  add_foreign_key "item_tag_relations", "items"
  add_foreign_key "item_tag_relations", "tags"
  add_foreign_key "items", "stores"
  add_foreign_key "orders", "customers"
  add_foreign_key "orders", "stores"
  add_foreign_key "store_addresses", "stores"
  add_foreign_key "store_categories", "categories"
  add_foreign_key "store_categories", "stores"
  add_foreign_key "store_informations", "stores"
end
