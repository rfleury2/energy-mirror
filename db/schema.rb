# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_03_180519) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buildings", force: :cascade do |t|
    t.string "display_name"
    t.string "primary_property_type"
    t.string "gross_square_feet"
    t.string "address_line_1"
    t.string "address_line_2"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.json "energy_star_attributes", default: {}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "organization_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "display_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "organization_id"
    t.string "display_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "utility_accounts", force: :cascade do |t|
    t.string "utility_name"
    t.string "resource_type"
    t.string "customer_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "utility_data_provider_name", default: "utility_api"
    t.string "utility_data_provider_id"
    t.integer "organization_id"
  end

  create_table "utility_bills", force: :cascade do |t|
    t.string "utility_data_provider_id"
    t.string "utility_data_provider_name"
    t.bigint "utility_meter_id"
    t.date "end_date"
    t.date "start_date"
    t.date "statement_date"
    t.decimal "total_cost"
    t.decimal "total_volume"
    t.string "consumption_unit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["utility_meter_id"], name: "index_utility_bills_on_utility_meter_id"
  end

  create_table "utility_meters", force: :cascade do |t|
    t.bigint "utility_account_id"
    t.bigint "building_id"
    t.string "utility_data_provider_name", default: "utility_api"
    t.string "utility_data_provider_id"
    t.string "status"
    t.string "meter_number"
    t.string "service_address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["building_id"], name: "index_utility_meters_on_building_id"
    t.index ["utility_account_id"], name: "index_utility_meters_on_utility_account_id"
  end

end
