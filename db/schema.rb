# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160308020932) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body",          limit: 65535
    t.string   "resource_id",   limit: 255,   null: false
    t.string   "resource_type", limit: 255,   null: false
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.integer  "store_id",               limit: 4
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
  add_index "admin_users", ["store_id"], name: "index_admin_users_on_store_id", using: :btree

  create_table "cart_items", force: :cascade do |t|
    t.integer  "owner_id",   limit: 4
    t.string   "owner_type", limit: 255
    t.integer  "quantity",   limit: 4
    t.integer  "item_id",    limit: 4
    t.string   "item_type",  limit: 255
    t.float    "price",      limit: 24
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "carts", force: :cascade do |t|
    t.string   "session_id", limit: 255
    t.string   "string",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "store_id",   limit: 4
    t.string   "identifier", limit: 255
  end

  add_index "categories", ["store_id"], name: "index_categories_on_store_id", using: :btree

  create_table "order_items", force: :cascade do |t|
    t.string   "name",       limit: 255,                null: false
    t.decimal  "price",                  precision: 10, null: false
    t.integer  "quantity",   limit: 4,                  null: false
    t.integer  "order_id",   limit: 4,                  null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "orders", force: :cascade do |t|
    t.decimal  "subtotal",                       precision: 10
    t.decimal  "tax",                            precision: 10
    t.decimal  "shipping",                       precision: 10
    t.decimal  "total",                          precision: 10
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.integer  "user_id",            limit: 4
    t.integer  "store_id",           limit: 4
    t.string   "address",            limit: 255
    t.string   "name",               limit: 255
    t.string   "phone",              limit: 255
    t.string   "card_number_ending", limit: 255
  end

  add_index "orders", ["store_id"], name: "index_orders_on_store_id", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.integer  "quantity",           limit: 4
    t.integer  "category_id",        limit: 4
    t.integer  "store_id",           limit: 4
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.text     "description",        limit: 65535
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.decimal  "price",                            precision: 10
  end

  create_table "shipping_addresses", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "phone",      limit: 255
    t.string   "city",       limit: 255
    t.string   "address",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_id",    limit: 4
  end

  add_index "shipping_addresses", ["user_id"], name: "index_shipping_addresses_on_user_id", using: :btree

  create_table "store_requests", force: :cascade do |t|
    t.string   "full_name",     limit: 255
    t.string   "phone",         limit: 255
    t.string   "email",         limit: 255
    t.string   "password",      limit: 255
    t.string   "store_name",    limit: 255
    t.string   "store_address", limit: 255
    t.string   "store_phone",   limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "stores", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.string   "identifier",        limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "logo_file_name",    limit: 255
    t.string   "logo_content_type", limit: 255
    t.integer  "logo_file_size",    limit: 4
    t.datetime "logo_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.integer  "store_id",               limit: 4
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["store_id"], name: "index_users_on_store_id", using: :btree

end
