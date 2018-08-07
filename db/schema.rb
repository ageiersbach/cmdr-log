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

ActiveRecord::Schema.define(version: 2018_08_07_025708) do

  create_table "cargo_items", force: :cascade do |t|
    t.integer "commander_id"
    t.integer "commodity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commander_id"], name: "index_cargo_items_on_commander_id"
    t.index ["commodity_id"], name: "index_cargo_items_on_commodity_id"
  end

  create_table "cargo_logs", force: :cascade do |t|
    t.datetime "timestamp"
    t.integer "commodity_id"
    t.integer "commander_id"
    t.integer "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commander_id"], name: "index_cargo_logs_on_commander_id"
    t.index ["commodity_id"], name: "index_cargo_logs_on_commodity_id"
  end

  create_table "commanders", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "location_type"
    t.integer "location_id"
    t.string "token"
    t.datetime "token_expiration"
    t.index ["email"], name: "index_commanders_on_email", unique: true
    t.index ["location_type", "location_id"], name: "index_commanders_on_location_type_and_location_id"
    t.index ["reset_password_token"], name: "index_commanders_on_reset_password_token", unique: true
    t.index ["token"], name: "index_commanders_on_token", unique: true
  end

  create_table "commodities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mission_log_targets", force: :cascade do |t|
    t.datetime "expiration"
    t.integer "station_id"
    t.integer "mission_log_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mission_log_id"], name: "index_mission_log_targets_on_mission_log_id"
    t.index ["station_id"], name: "index_mission_log_targets_on_station_id"
  end

  create_table "mission_logs", force: :cascade do |t|
    t.datetime "timestamp"
    t.string "description"
    t.integer "ed_mission_id"
    t.integer "commander_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commander_id"], name: "index_mission_logs_on_commander_id"
  end

  create_table "star_systems", force: :cascade do |t|
    t.string "name"
    t.float "x"
    t.float "y"
    t.float "z"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stations", force: :cascade do |t|
    t.integer "star_system_id"
    t.string "name"
    t.string "construction"
    t.float "distance_from_star_ls"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["star_system_id"], name: "index_stations_on_star_system_id"
  end

  create_table "target_commodities", force: :cascade do |t|
    t.integer "commodity_id"
    t.integer "mission_log_target_id"
    t.integer "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commodity_id"], name: "index_target_commodities_on_commodity_id"
    t.index ["mission_log_target_id"], name: "index_target_commodities_on_mission_log_target_id"
  end

end
