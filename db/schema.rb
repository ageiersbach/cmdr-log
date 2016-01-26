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

ActiveRecord::Schema.define(version: 20160126133424) do

  create_table "cmdrs", force: :cascade do |t|
    t.string   "name"
    t.integer  "balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "commodities", force: :cascade do |t|
    t.string   "name"
    t.integer  "galactic_average"
    t.integer  "category"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "commodity_exchanges", force: :cascade do |t|
    t.integer  "commodity_id"
    t.integer  "entry_id"
    t.integer  "price"
    t.integer  "quantity"
    t.string   "type",         null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "ship_id"
  end

  add_index "commodity_exchanges", ["commodity_id"], name: "index_commodity_exchanges_on_commodity_id"
  add_index "commodity_exchanges", ["entry_id"], name: "index_commodity_exchanges_on_entry_id"
  add_index "commodity_exchanges", ["ship_id"], name: "index_commodity_exchanges_on_ship_id"

  create_table "entries", force: :cascade do |t|
    t.integer  "cmdr_id"
    t.integer  "system_object_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "activity",         default: 0
    t.boolean  "is_closed",        default: false, null: false
  end

  add_index "entries", ["cmdr_id"], name: "index_entries_on_cmdr_id"
  add_index "entries", ["system_object_id"], name: "index_entries_on_system_object_id"

  create_table "ships", force: :cascade do |t|
    t.integer  "cmdr_id"
    t.boolean  "is_current",     default: false
    t.string   "model"
    t.integer  "cargo_capacity"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "ships", ["cmdr_id"], name: "index_ships_on_cmdr_id"

  create_table "system_objects", force: :cascade do |t|
    t.integer  "system_id"
    t.string   "name"
    t.integer  "object_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "system_objects", ["system_id"], name: "index_system_objects_on_system_id"

  create_table "systems", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
