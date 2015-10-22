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

ActiveRecord::Schema.define(version: 20151022001329) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_types", force: true do |t|
    t.string   "account_type_code"
    t.string   "account_type_name"
    t.integer  "initial_discount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "accounts", force: true do |t|
    t.string   "account_name"
    t.string   "account_type_code"
    t.integer  "person_id"
    t.integer  "credit_limit"
    t.float    "balance"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees", force: true do |t|
    t.integer  "person_id"
    t.integer  "store_number"
    t.string   "pay_type_code"
    t.integer  "pay_amount"
    t.string   "title"
    t.integer  "supervisor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inventories", force: true do |t|
    t.integer  "store_number"
    t.integer  "quantity_on_hand"
    t.integer  "quantity_on_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_headers", force: true do |t|
    t.integer  "invoice_number"
    t.integer  "store_number"
    t.integer  "person_id"
    t.date     "order_date"
    t.date     "est_delivery_date"
    t.date     "delivery_date"
    t.integer  "account_number"
    t.float    "amount_due"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_items", force: true do |t|
    t.integer  "invoice_number"
    t.integer  "product_id"
    t.integer  "quantity"
    t.float    "discount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pay_types", force: true do |t|
    t.string   "pay_type_code"
    t.string   "pay_type_name"
    t.integer  "minimum_wage"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", force: true do |t|
    t.string   "lastname"
    t.string   "firstname"
    t.string   "mi"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.integer  "area_code"
    t.integer  "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "po_headers", force: true do |t|
    t.integer  "po_number"
    t.integer  "vendor_id"
    t.integer  "store_number"
    t.date     "order_date"
    t.integer  "tax_rate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "po_items", force: true do |t|
    t.integer  "po_number"
    t.integer  "vendor_part_number"
    t.integer  "quantity"
    t.integer  "unit_cost"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_categories", force: true do |t|
    t.string   "product_category_code"
    t.string   "product_category_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "description"
    t.float    "price"
    t.integer  "reorder_threshold"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stores", force: true do |t|
    t.integer  "manager_id"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.integer  "area_code"
    t.integer  "phone_number"
    t.integer  "sales_tax_rate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vendors", force: true do |t|
    t.string   "name"
    t.integer  "vendor_rep_id"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "country"
    t.integer  "area_code"
    t.integer  "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
