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

ActiveRecord::Schema.define(version: 20150807031224) do

  create_table "card_statements", force: :cascade do |t|
    t.float    "value"
    t.text     "note"
    t.integer  "user_id"
    t.integer  "statement_type_id"
    t.integer  "operator_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "card_statements", ["operator_id"], name: "index_card_statements_on_operator_id"
  add_index "card_statements", ["statement_type_id"], name: "index_card_statements_on_statement_type_id"
  add_index "card_statements", ["user_id"], name: "index_card_statements_on_user_id"

  create_table "contacts", force: :cascade do |t|
    t.string   "full_name"
    t.string   "phone_no"
    t.text     "address"
    t.boolean  "male"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "contacts", ["user_id"], name: "index_contacts_on_user_id"

  create_table "coupon_applicabilities", force: :cascade do |t|
    t.integer  "coupon_id"
    t.integer  "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "coupon_applicabilities", ["coupon_id"], name: "index_coupon_applicabilities_on_coupon_id"
  add_index "coupon_applicabilities", ["item_id"], name: "index_coupon_applicabilities_on_item_id"

  create_table "coupon_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coupons", force: :cascade do |t|
    t.integer  "coupon_type_id"
    t.integer  "value"
    t.text     "note"
    t.datetime "start_datetime"
    t.datetime "end_datetime"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "coupons", ["coupon_type_id"], name: "index_coupons_on_coupon_type_id"

  create_table "defects", force: :cascade do |t|
    t.string   "picture"
    t.integer  "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "defects", ["order_id"], name: "index_defects_on_order_id"

  create_table "item_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.string   "unit"
    t.string   "picture"
    t.integer  "item_type_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "items", ["item_type_id"], name: "index_items_on_item_type_id"

  create_table "levels", force: :cascade do |t|
    t.float    "discount"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lineitems", force: :cascade do |t|
    t.integer  "quantity"
    t.string   "color"
    t.text     "note"
    t.integer  "order_id"
    t.integer  "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "lineitems", ["item_id"], name: "index_lineitems_on_item_id"
  add_index "lineitems", ["order_id"], name: "index_lineitems_on_order_id"

  create_table "membership_cards", force: :cascade do |t|
    t.float    "balance",    default: 0.0
    t.string   "card_no"
    t.integer  "user_id"
    t.integer  "level_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "membership_cards", ["level_id"], name: "index_membership_cards_on_level_id"
  add_index "membership_cards", ["user_id"], name: "index_membership_cards_on_user_id"

  create_table "order_trackers", force: :cascade do |t|
    t.integer  "step"
    t.text     "message"
    t.integer  "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "order_trackers", ["order_id", "created_at"], name: "index_order_trackers_on_order_id_and_created_at"
  add_index "order_trackers", ["order_id"], name: "index_order_trackers_on_order_id"

  create_table "orders", force: :cascade do |t|
    t.integer  "step"
    t.text     "message"
    t.datetime "pickup_datetime"
    t.datetime "delivery_datetime"
    t.datetime "paid_at"
    t.integer  "store_id"
    t.integer  "user_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "name"
    t.text     "address"
    t.string   "phone_no"
    t.boolean  "male"
    t.boolean  "expedited",         default: false
  end

  add_index "orders", ["store_id"], name: "index_orders_on_store_id"
  add_index "orders", ["user_id"], name: "index_orders_on_user_id"

  create_table "statement_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stores", force: :cascade do |t|
    t.text     "address"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "factory"
    t.string   "name"
    t.integer  "manager_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "stores", ["manager_id"], name: "index_stores_on_manager_id"

  create_table "user_coupons", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "coupon_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_coupons", ["coupon_id"], name: "index_user_coupons_on_coupon_id"
  add_index "user_coupons", ["user_id"], name: "index_user_coupons_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "phone_no"
    t.string   "full_name"
    t.string   "wechat_id"
    t.boolean  "male",                  default: true
    t.string   "status",                default: "Client", null: false
    t.integer  "store_id"
    t.string   "verification_code"
    t.datetime "verification_datetime"
    t.boolean  "suspended"
    t.text     "suspension_reason"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "users", ["store_id"], name: "index_users_on_store_id"

end
