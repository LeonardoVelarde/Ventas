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

ActiveRecord::Schema.define(version: 20150611232038) do

  create_table "clients", force: true do |t|
    t.string   "name"
    t.string   "nit"
    t.string   "direction"
    t.boolean  "trusted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deliveries", force: true do |t|
    t.integer  "import_id"
    t.integer  "product_id"
    t.float    "price"
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "deliveries", ["import_id"], name: "index_deliveries_on_import_id"
  add_index "deliveries", ["product_id"], name: "index_deliveries_on_product_id"

  create_table "imports", force: true do |t|
    t.string   "provider"
    t.float    "total_price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "finished"
  end

  create_table "offers", force: true do |t|
    t.integer  "product_id"
    t.integer  "sale_id"
    t.float    "price"
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "offers", ["product_id"], name: "index_offers_on_product_id"
  add_index "offers", ["sale_id"], name: "index_offers_on_sale_id"

  create_table "products", force: true do |t|
    t.string   "name"
    t.string   "model"
    t.string   "description"
    t.float    "whole_sale_price"
    t.float    "retail_price"
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sales", force: true do |t|
    t.integer  "client_id"
    t.string   "type_name"
    t.float    "total_price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "finished"
  end

  add_index "sales", ["client_id"], name: "index_sales_on_client_id"

end
