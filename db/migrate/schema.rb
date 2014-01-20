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

ActiveRecord::Schema.define(version: 20140119101557) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: true do |t|
    t.string   "name"
    t.text     "address"
    t.string   "contact_person"
    t.string   "phone"
    t.string   "fax"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contract_types", force: true do |t|
    t.string   "short_name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contracts", force: true do |t|
    t.string   "contract_no"
    t.string   "name"
    t.text     "description"
    t.integer  "company_id"
    t.decimal  "value"
    t.date     "starts_on"
    t.date     "ends_on"
    t.date     "issued_by"
    t.integer  "contract_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fuel_tanks", force: true do |t|
    t.integer  "unit_id"
    t.string   "locations"
    t.decimal  "capacity"
    t.integer  "unit_type"
    t.integer  "fuel_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fuel_types", force: true do |t|
    t.string   "shortname"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kit_staffs", force: true do |t|
    t.integer  "kit_id"
    t.integer  "staff_id"
    t.integer  "staff_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kit_uniforms", force: true do |t|
    t.integer  "kit_id"
    t.integer  "uniform_id"
    t.integer  "quantity"
    t.string   "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "senior_rate"
  end

  create_table "kits", force: true do |t|
    t.string   "code"
    t.string   "combo_code"
    t.string   "name"
    t.string   "ancestry"
    t.integer  "ancestry_depth"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "maintenance_details", force: true do |t|
    t.integer  "maintenance_id"
    t.string   "line_item"
    t.decimal  "line_item_price"
    t.integer  "quantity"
    t.integer  "unit_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "maintenances", force: true do |t|
    t.integer  "vehicle_id"
    t.string   "work_order_no"
    t.integer  "contract_id"
    t.integer  "repaired_by"
    t.integer  "supplied_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ranks", force: true do |t|
    t.string   "shortname"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "staff_measurements", force: true do |t|
    t.integer  "staff_id"
    t.integer  "uniform_id"
    t.string   "measurement_type"
    t.decimal  "value"
    t.integer  "unit_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "staffs", force: true do |t|
    t.string   "id_no"
    t.integer  "rank_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "uniform_items", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "uniform_stock_issues", force: true do |t|
    t.integer  "stock_id"
    t.integer  "issued_to"
    t.integer  "issued_by"
    t.date     "issued_on"
    t.integer  "quantity"
    t.integer  "document_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "uniform_stock_receiveds", force: true do |t|
    t.integer  "stock_id"
    t.integer  "quantity"
    t.decimal  "size"
    t.date     "received_on"
    t.integer  "received_by"
    t.integer  "contract_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "uniform_stocks", force: true do |t|
    t.integer  "uniform_id"
    t.decimal  "size"
    t.string   "category"
    t.integer  "max_quantity"
    t.integer  "min_quantity"
    t.integer  "unit_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "unit_types", force: true do |t|
    t.string   "short_name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "units", force: true do |t|
    t.string   "shortname"
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vehicle_assignment_details", force: true do |t|
    t.integer  "vehicle_assignment_id"
    t.integer  "vehicle_id"
    t.integer  "staff_id"
    t.date     "assigned_on"
    t.date     "assignment_end"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vehicle_assignments", force: true do |t|
    t.integer  "document_code"
    t.date     "document_date"
    t.integer  "authorised_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vehicle_card_payments", force: true do |t|
    t.integer  "vehicle_card_id"
    t.date     "updated_on"
    t.decimal  "amount"
    t.string   "receipt_no"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vehicle_cards", force: true do |t|
    t.integer  "vehicle_id"
    t.string   "serial_no"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "staff_id"
    t.integer  "unit_id"
    t.boolean  "smart_tag"
    t.date     "issue_date"
    t.date     "start_date"
    t.date     "expired_date"
    t.string   "smarttag_serial"
  end

  create_table "vehicle_categories", force: true do |t|
    t.string   "short_name",  limit: 12
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vehicle_fine_types", force: true do |t|
    t.string   "short_name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vehicle_fines", force: true do |t|
    t.string   "code"
    t.integer  "vehicle_id"
    t.integer  "type_id"
    t.datetime "issued_at"
    t.date     "pay_before"
    t.string   "location"
    t.string   "reason"
    t.decimal  "compound"
    t.string   "receipt_no"
    t.date     "paid_on"
    t.decimal  "paid_amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vehicle_manufacturers", force: true do |t|
    t.string   "name"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vehicle_road_taxes", force: true do |t|
    t.integer  "vehicle_id"
    t.date     "start_on"
    t.date     "end_on"
    t.decimal  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vehicle_statuses", force: true do |t|
    t.string   "short_name",  limit: 12
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vehicles", force: true do |t|
    t.string   "reg_no",            limit: 8
    t.string   "chassis_no"
    t.string   "engine_no"
    t.date     "reg_on"
    t.string   "manufacturer_year"
    t.integer  "manufacturer_id"
    t.string   "model"
    t.integer  "category_id"
    t.date     "acquired_on"
    t.decimal  "price",                       precision: 10, scale: 2
    t.integer  "contract_id"
    t.integer  "status_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
